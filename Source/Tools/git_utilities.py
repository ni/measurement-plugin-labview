import re
import subprocess


def get_changed_files(target_ref):
    """
    Get files which have changed compared to the target ref.

    :param target_ref: The git ref to check for changed files against
    :return: Tuples of the form (status, filename) where status is either "A" or "M", depending on whether the file was added or modified.
    """
    diff_args = ["git", "diff", "--name-status", "--diff-filter=AM", target_ref + "..."]
    diff_output = subprocess.check_output(diff_args).decode("utf-8")

    # https://regex101.com/r/EFVDVV/2
    diff_regex = re.compile(r"^([AM])\s+(.*)$", re.MULTILINE)

    for match in re.finditer(diff_regex, diff_output):
        yield match.group(1), match.group(2)
