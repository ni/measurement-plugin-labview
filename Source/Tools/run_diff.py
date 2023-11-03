
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

def main():
    # TODO: recieve target branch name as param from workflow
    target_branch = "origin/main"

    (added_labview_files, modified_labview_files) = get_changed_labview_files(target_branch)

    with open('added_lv_files.txt', 'w') as added_labview_files_file:
        for filename in added_labview_files:
            added_labview_files_file.write(filename + "\n")

    with open('modified_lv_files.txt', 'w') as modified_labview_files_file:
        for filename in modified_labview_files:
            modified_labview_files_file.write(filename + "\n")

    # Temporarily disable copy of main
    # temp_directory = export_repo(target_branch)
    # _logger.debug(temp_directory)

    return_code = run_full_diff()
    sys.exit(return_code)


def run_full_diff():
    tools_directory = os.path.abspath(os.path.dirname(__file__))
    diff_vi = os.path.join(tools_directory , "run_diff.vi")
    _logger.debug(f"Launching {diff_vi}.")
    test_result = subprocess.run(["LabVIEWCLI", "-OperationName", "RunVI", "-VIPath", os.path.normpath(diff_vi)], capture_output= True)

    formatted_stdout = test_result.stdout.decode().replace('\r\n','\n').strip()
    _logger.debug(formatted_stdout)
    if(test_result.returncode != 0):
        formatted_stderr = test_result.stderr.decode().replace('\r\n','\n').strip()
        _logger.error(formatted_stderr)

    return test_result.returncode


main()
