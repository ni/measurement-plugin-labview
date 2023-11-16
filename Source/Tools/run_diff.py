import click
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

    (added_labview_files, modified_labview_files) = get_changed_labview_file_paths(repo_root_directory, pr_number, token)

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
    if (diff_result.returncode == 0):
        _logger.debug(formatted_stdout)

        # This might be simpler than the regex
        idx1 = formatted_stdout.find("Operation output:") + len("Operation output:") + 1
        idx2 = formatted_stdout.find("Full report stored at:")

        diff_summary = formatted_stdout[idx1: idx2].strip()
        # Substitution using &nbsp preserves indentation
        diff_summary = re.sub("  ", "&nbsp;&nbsp;", diff_summary)
        if pr_number is not None and token is not None:
            post_github_pr_text_comment(diff_summary, pr_number, token)
        else:
            _logger.debug(diff_summary)
        return 0
    else:
        _logger.error("Expected return code of zero from LabVIEWCLI call.")

    if pr_number is not None and token is not None:
        post_github_pr_text_comment("An unexpected failure occurred when attempting automated graphical diff.", pr_number, token)

    # Failures in diff workflow shall not flag the PR with a failed PR check
    # OR do we want to consider this an optional check at the pr level..?
    return diff_result.returncode


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


def get_git_diff_changed_files():
    diff_args = ["git", "diff", "--name-status", "--diff-filter=AM", "origin/main..."]
    diff_output = subprocess.check_output(diff_args).decode("utf-8")

    diff_regex = re.compile(r"^([AM])\s+(.*)$", re.MULTILINE)

    for match in re.finditer(diff_regex, diff_output):
        yield match.group(1), match.group(2)


def get_changed_labview_file_paths(repo_root_directory, pr_number, token):
    changed_files = []
    if pr_number is not None and token is not None:
        changed_files = get_github_pr_changed_files(pr_number, token)
    else:
        changed_files = get_git_diff_changed_files()

    diff_regex = re.compile(r"^(.*\.vi[tm]?)|(.*\.ctl?)$", re.MULTILINE)

    added_labview_files = []
    modified_labview_files = []
    for status, filename in changed_files:
        if re.match(diff_regex, filename):
            absolute_file_path = os.path.normpath(os.path.join(repo_root_directory, filename))
            if status == 'A' or status == "added":
                added_labview_files.append(absolute_file_path)
            if status == 'M' or status == "modified":
                modified_labview_files.append(absolute_file_path)

    return added_labview_files, modified_labview_files


def create_github_request_header(token):
    return {"Authorization": "token %s" % token.strip()}


def post_github_pr_text_comment(text, pr_number, token):
    # Using "issues" in this url allows for providing a pr-scoped comment.
    # If using "pulls" instead, subschema infomration (e.g. file or line) is required in the data.
    url = f"https://api.github.com/repos/ni/measurementlink-labview/issues/{pr_number}/comments"
    data = json.dumps({"body": text})
    header = create_github_request_header(token)

    _logger.debug(f"Posting pr text comment to {url}")
    response = requests.post(url, data=data, headers=header)
    if response.ok:
        _logger.debug(f"Response code: {response.status_code}")
    else:
        _logger.error(f"Bad response. url:{url}, code:{response.status_code}, text:{response.text}")

    return response.status_code


def get_github_pr_changed_files(pr_number, token):
    url = f"https://api.github.com/repos/ni/measurementlink-labview/pulls/{pr_number}/files"
    header = create_github_request_header(token)

    _logger.debug(f"Getting files information from {url}")
    response = requests.get(url, headers=header)
    if response.ok:
        _logger.debug(f"Response code: {response.status_code}")
    else:
        _logger.error(f"Bad response. url:{url}, code:{response.status_code}, text:{response.text}")

    file_set = response.json()

    for file_info in file_set:
        yield file_info["status"], file_info["filename"]


@click.command()
@click.option(
    "-p",
    "--pull-req",
    help="Github pull request number",
)
@click.option(
    "-t",
    "--token",
    help="Github Access token needed to perform write operations",
)
def main(pull_req, token):
    pr_number = pull_req

    if pr_number is not None and token is not None:
        _logger.debug(f"Running for pull request #{pr_number} with provided token.")

    return_code = run_full_diff(pr_number, token)

    sys.exit(return_code)


if __name__ == "__main__":
    return_code = main()
    sys.exit(return_code)
