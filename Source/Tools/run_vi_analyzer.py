import logging
import os
import subprocess
import sys
import tempfile

_logger = logging.getLogger(__name__)
_logger.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
_logger.addHandler(handler)

def main():
    return_code = run_all_tests()
    sys.exit(return_code)


def run_all_tests():
    tools_directory = os.path.abspath(os.path.dirname(__file__))
    vi_analyzer_config_path = os.path.join(tools_directory, "PR.viancfg")
    _logger.debug(f"Analyzing VIs per {vi_analyzer_config_path}.")
    vi_analyzer_output_path = tempfile.TemporaryFile().name
    kwargs = ["LabVIEWCLI", "-OperationName", "RunVIAnalyzer", "-ConfigPath", vi_analyzer_config_path, "-ReportPath", vi_analyzer_output_path,  "-LabVIEWPath", "C:\\Program Files\\National Instruments\\LabVIEW 2023\\LabVIEW.exe", "-PortNumber", "3366"]
    test_result = subprocess.run(kwargs, capture_output= True)
    
    formatted_stdout = test_result.stdout.decode().replace('\r\n','\n').strip()
    _logger.debug(formatted_stdout)
    if(test_result.returncode != 0):
        formatted_stderr = test_result.stderr.decode().replace('\r\n','\n').strip()
        _logger.error(formatted_stderr)
        with open(vi_analyzer_output_path, "r") as vi_analyzer_output:
            _logger.error(vi_analyzer_output.read())

    return test_result.returncode


main()