
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
    _logger.debug(f"Looking for tests")
    run_all_tests()

def run_all_tests():
    test_directory = os.path.abspath(os.path.dirname(__file__))
    _logger.debug(f"Running tests in {test_directory}...")
    test_runner_vi = os.path.join(test_directory, "TBD\\gRPC_ATS.vi")
    test_file = os.path.join(test_directory , "Tests.lst")
    failed_test_results = ""
    with open(test_file, 'r') as file:
        all_tests = file.read().splitlines()
        for test in all_tests:
            run_test(test_runner_vi, os.path.join(test_directory, test))


def run_test(WrapperVI, testVI):
    if os.path.exists(testVI):
        _logger.debug(f"[DEBUG]: {testVI} found on disk.  TBD: Run it and return results.")
    else:
        _logger.error(f"[FAILED]: {testVI} does not exist.")


main()
