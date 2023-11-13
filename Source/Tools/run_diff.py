
import json
import logging
import os
import re
import requests
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

_logger = logging.getLogger(__name__)
_logger.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
_logger.addHandler(handler)


def run_full_diff(pr_number, token):
    tools_directory = Path(os.path.dirname(__file__))
    source_directory = tools_directory.parent
    repo_root_directory = source_directory.parent

    added_labview_files = []
    modified_labview_files = []
    if pr_number is not None and token is not None:
        (added_labview_files, modified_labview_files) = get_github_pr_changed_labview_file_paths(pr_number, token)
    else:
        (added_labview_files, modified_labview_files) = get_git_changed_labview_file_paths(repo_root_directory)

    target_snapshot_directory = copy_target_branch_into_temp_directory(repo_root_directory)

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


def copy_target_branch_into_temp_directory(repo_root_directory):
    temp_directory = tempfile.TemporaryDirectory()
    _logger.debug(temp_directory)

    # When invoked via workflow, the workflow should have pre-populated the "target" dir already
    target_branch_from_workflow = os.path.join(repo_root_directory, "target_for_diff")
    if os.path.exists(target_branch_from_workflow):
        # move the copy provided by the workflow into the temp dir
        os.rmdir(temp_directory.name)
        os.rename(target_branch_from_workflow, temp_directory.name)
    else:
        # use `git checkout` to populate the temp dir with the target branch content
        shutil.copytree(os.path.join(repo_root_directory, ".git"), os.path.join(temp_directory.name, ".git"))
        subprocess.check_call(["git", "checkout", "-f", "origin/main"], cwd=temp_directory.name)

    return (temp_directory)


def get_git_changed_files():
    diff_args = ["git", "diff", "--name-status", "--diff-filter=AM", "origin/main..."]
    diff_output = subprocess.check_output(diff_args).decode("utf-8")

    diff_regex = re.compile(r"^([AM])\s+(.*)$", re.MULTILINE)

    for match in re.finditer(diff_regex, diff_output):
        yield match.group(1), match.group(2)


def get_git_changed_labview_file_paths(repo_root_directory):
    changed_files = get_git_changed_files()

    diff_regex = re.compile(r"^(.*\.vi[tm]?)|(.*\.ctl?)$", re.MULTILINE)

    added_labview_files = []
    modified_labview_files = []
    for status, filename in changed_files:
        if re.match(diff_regex, filename):
            absolute_file_path = os.path.normpath(os.path.join(repo_root_directory, filename))
            if status == 'A':
                added_labview_files.append(absolute_file_path)
            if status == 'M':
                modified_labview_files.append(absolute_file_path)

    return added_labview_files, modified_labview_files


def create_github_request_header(token):
    return {"Authorization": "token %s" % token.strip()}


def post_github_pr_text_comment(text, pr_number, token):
    url = f"https://api.github.com/repos/ni/measurementlink-labview/pulls/{pr_number}/comments"
    data = json.dumps({"body": text})
    header = create_github_request_header(token)

    _logger.debug(f"Posting pr text comment to {url}")
    response = requests.post(url, data=data, headers=header)
    if response.ok:
        _logger.debug(f"Response code: {response.status_code}")
    else:
        _logger.error(f"Bad response. url:{url}, code:{response.status_code}, text:{response.text}")

    return r.status_code


def get_github_pr_changed_labview_file_paths(pr_number, token):
    url = f"https://api.github.com/repos/ni/measurementlink-labview/pulls/{pr_number}/files"
    header = create_github_request_header(token)

    _logger.debug(f"Getting files information from {url}")
    response = requests.get(url, headers=header)
    if response.ok:
        _logger.debug(f"Response code: {response.status_code}")
    else:
        _logger.error(f"Bad response. url:{url}, code:{response.status_code}, text:{response.text}")
        return [], []

    file_set = response.json()

    for file_info in file_set:
        filename = file_info["filename"]
        file_status = file_info["status"]
        print(f"{filename} : {file_status}")

    added_labview_files = []
    modified_labview_files = []

    return added_labview_files, modified_labview_files


def main(args):
    options = parse_options(args)

    if options.pr is not None and options.token is not None:
        print(f"Running for pull request #{options.pr}")
        # post_github_pr_text_comment(f"Comment added via github API from {__file__}", options.pr, options.token)

    return_code = run_full_diff(options.pr, options.token)

    sys.exit(return_code)


if __name__ == "__main__":
    retCode = main(sys.argv[1:])
    sys.exit(retCode)
