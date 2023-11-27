
import argparse
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
    labview_path, port_number = _parse_command_line_args()
    return_code = run_all_tests(labview_path, port_number)
    sys.exit(return_code)


def run_all_tests(labview_path: str, port_number: int):
    test_directory = os.path.abspath(os.path.dirname(__file__))
    test_runner_vi = os.path.join(test_directory , "run_tests.vi")
    _logger.debug(f"Launching {test_runner_vi}.")
    kwargs = ["LabVIEWCLI", "-OperationName", "RunVI", "-VIPath", os.path.normpath(test_runner_vi), "-PortNumber", str(port_number)]
    if labview_path:
        kwargs.extend(["-LabVIEWPath", labview_path])
    test_result = subprocess.run(kwargs, capture_output= True)
    
    formatted_stdout = test_result.stdout.decode().replace('\r\n','\n').strip()
    _logger.debug(formatted_stdout)
    if(test_result.returncode != 0):
        formatted_stderr = test_result.stderr.decode().replace('\r\n','\n').strip()
        _logger.error(formatted_stderr)

    return test_result.returncode


def _parse_command_line_args():
    parser = argparse.ArgumentParser(description="Run LabVIEW tests using LabVIEWCLI")
    parser.add_argument("--labview-path", type=str, help="Path to the LabVIEW executable", nargs='?', default=None)
    parser.add_argument("--port-number", type=int, help="TCP/IP port number of LabVIEW executable", nargs='?', default=3363)

    args = parser.parse_args()
    return args.labview_path, args.port_number


main()
