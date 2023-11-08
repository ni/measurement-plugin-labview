
import logging
import os
import subprocess
import sys
from labview_diff import get_changed_labview_files
from labview_diff import export_repo

_logger = logging.getLogger(__name__)
_logger.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
_logger.addHandler(handler)

def run_full_diff():
    # TODO: recieve target branch name as param from workflow
    target_branch = "origin/main"

    (added_labview_files, modified_labview_files) = get_changed_labview_files(target_branch)

    target_snapshot_directory = export_repo(target_branch)

    tools_directory = os.path.abspath(os.path.dirname(__file__))
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
    _logger.debug(formatted_stdout)
    if(diff_result.returncode != 0):
        formatted_stderr = diff_result.stderr.decode().replace('\r\n','\n').strip()
        _logger.error(formatted_stderr)

    return diff_result.returncode


def main():
    return_code = run_full_diff()
    sys.exit(return_code)


main()
