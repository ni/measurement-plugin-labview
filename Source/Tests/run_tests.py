
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
    return run_all_tests()


def run_all_tests():
    test_directory = os.path.abspath(os.path.dirname(__file__))
    test_runner_vi = os.path.join(test_directory , "run_tests.vi")
    _logger.debug(f"Launching {test_runner_vi}.")
    test_result = subprocess.run(["LabVIEWCLI", "-OperationName", "RunVI", "-VIPath", os.path.normpath(test_runner_vi)], capture_output= True)
    
    formatted_output = test_result.stdout.decode().replace('\r\n','\n')
    _logger.debug(formatted_output)
    if(test_result.returncode != 0):
        formatted_error = test_result.stderr.decode().replace('\r\n','\n')
        _logger.error(formatted_error)

    return test_result.returncode


main()
