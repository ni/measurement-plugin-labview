
import logging
import os
import subprocess
import sys

_logger = logging.getLogger(__name__)
_logger.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
_logger.addHandler(handler)

def main():
    run_all_tests()


def run_individual_tests():
    test_directory = os.path.abspath(os.path.dirname(__file__))
    test_list_filename = "Tests.lst"
    test_file = os.path.join(test_directory , test_list_filename)
    _logger.debug(f"Running tests under {test_directory}, as defined in `{test_list_filename}`...")

    failed_test_results = ""
    with open(test_file, 'r') as file:
        all_tests = file.read().splitlines()
        for test in all_tests:
            run_test(os.path.join(test_directory, test))


def run_test(testVI):
    if os.path.exists(testVI):
        testResult = subprocess.run(["LabVIEWCLI", "-OperationName", "RunVI", "-VIPath", os.path.normpath(testVI)], capture_output= True)
        testVI_filename = os.path.basename(testVI)
        _logger.debug(f"[Ran Test]: {testVI_filename}")
        
    else:
        _logger.error(f"[FAILED]: `{testVI}` does not exist.")


def run_all_tests():
    test_directory = os.path.abspath(os.path.dirname(__file__))
    test_runner_vi = os.path.join(test_directory , "run_tests.vi")
    _logger.debug(f"Launching {test_runner_vi}.")
    test_result = subprocess.run(["LabVIEWCLI", "-OperationName", "RunVI", "-VIPath", os.path.normpath(test_runner_vi)], capture_output= True)
    _logger.debug(f"Result: {test_result}.")

main()
