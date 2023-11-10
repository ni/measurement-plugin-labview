
import logging
import os
import requests
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path
from labview_diff import get_changed_labview_files

_logger = logging.getLogger(__name__)
_logger.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
_logger.addHandler(handler)


def run_full_diff():
    # TODO: recieve target branch name as param from workflow
    target_branch = "origin/main"

    added_labview_files = []
    modified_labview_files = []
    # Temporarily disable this call
    # (added_labview_files, modified_labview_files) = get_changed_labview_files(target_branch)

    tools_directory = Path(os.path.dirname(__file__))
    source_directory = tools_directory.parent
    repo_root_directory = source_directory.parent

    target_snapshot_directory = copy_target_branch_into_temp_directory(repo_root_directory, target_branch)

    diff_vi = os.path.join(tools_directory , "run_diff.vi")
    _logger.debug(f"Launching {diff_vi}.")

    kwargs = ["LabVIEWCLI", "-OperationName", "RunVI", "-VIPath", os.path.normpath(diff_vi)]
    kwargs.extend(["--added_labview_files"])
    kwargs.extend(added_labview_files)
    kwargs.extend(["--modified_labview_files"])
    kwargs.extend(modified_labview_files)
    kwargs.extend(["--target_snapshot_directory", target_snapshot_directory.name])

    diff_result = subprocess.run(kwargs, capture_output= True)

    formatted_stdout = diff_result.stdout.decode().replace('\r\n','\n').strip()
    if(diff_result.returncode == 0):
        _logger.debug(formatted_stdout)
        print(formatted_stdout)
    else:
        formatted_stderr = diff_result.stderr.decode().replace('\r\n','\n').strip()
        _logger.error(formatted_stderr)
        print(f"Error {diff_result.returncode} occured when generating diff.")

    return diff_result.returncode


def parse_options(args):
    import optparse

    parser = optparse.OptionParser("usage: %prog --token TOKEN --pull-req PULLREQUEST")

    # Setup parser
    parser.add_option(
        "-t",
        "--token",
        dest="token",
        metavar="TOKEN",
        help="Github Access token needed to perform write operations",
    )
    parser.add_option(
        "-p",
        "--pull-req",
        dest="pr",
        metavar="PR",
        help="Github pull request number",
    )

    (options, args) = parser.parse_args(args)

    if args:
        parser.error("Positional arguments are not supported: %r" % (args,))

    return options


def copy_target_branch_into_temp_directory(repo_root_directory, target_branch):
    temp_directory = tempfile.TemporaryDirectory()
    _logger.debug(temp_directory)

    # When invoked via workflow, the workflow should have pre-populated the "target" dir already
    target_branch_from_workflow = os.path.join(repo_root_directory, "target")
    if os.path.exists(target_branch_from_workflow):
        # move the copy provided by the workflow into the temp dir
        os.rmdir(temp_directory.name)
        os.rename(target_branch_from_workflow, temp_directory.name)
    else:
        # use `git checkout` to populate the temp dir with the target branch content
        shutil.copytree(os.path.join(repo_root_directory, ".git"), os.path.join(temp_directory.name, ".git"))
        subprocess.check_call(["git", "checkout", "-f", target_branch], cwd=temp_directory.name)

    return (temp_directory)


def create_github_request_header(token):
    return {"Authorization": "token %s" % token.strip()}


def post_github_pr_text_comment(text, pr_number, token):
    url = f"https://api.github.com/repos/ni/measurementlink-labview/issues/{pr_number}/comments"
    data = json.dumps({"body": text})
    header = create_github_request_header(token)

    _logger.debug(f"Posting pr text comment to {url}")
    r = requests.post(url, data=data, headers=header)
    if r.ok:
        _logger.debug(f"Response code: {r.status_code}")
    else:
        _logger.error(f"Bad response. url:{url}, code:{r.status_code}, text:{r.text}")

    return r.status_code


def main(args):
    options = parse_options(args)
    # print(options.token)
    if options.pr is not None and options.token is not None:
        print(f"Running for pull request #{options.pr}")
        post_github_pr_text_comment(f"Comment added via github API from {__file__}", options.pr, options.token)

    return_code = run_full_diff()

    sys.exit(return_code)


if __name__ == "__main__":
    retCode = main(sys.argv[1:])
    sys.exit(retCode)
