import os
import re
import shutil
import stat
import subprocess
import tempfile
import traceback
from contextlib import contextmanager
from os import path

import git_utilities


def diff_vi(old_vi, new_vi, output_dir, workspace, lv_version):
    """
    Generates a diff of LabVIEW VIs

    VIs which fail to be diffed are logged to {output_dir}/diff_failures.txt.

    :param old_vi: The older version of the VI; if bool(vi1) is false, the VI is assumed to be newly added
    :param new_vi: The newer version of the VI
    :param output_dir: The directory in which to store output
    :param workspace: The directory above the niveristand-custom-device-build-tools
    :param lv_version: The year version of LabVIEW to use for diffing
    """

    version_path = labview_path_from_year(lv_version)

    command_args = [
        "LabVIEWCLI.exe",
        "-LabVIEWPath",
        version_path,
        "-AdditionalOperationDirectory",
        workspace + r"\niveristand-custom-device-build-tools\lv\operations\\",
        "-OperationName",
        "DiffVI",
        "-NewVI",
        new_vi,
        "-OutputDir",
        output_dir,
    ]

    if old_vi:
        command_args.extend(["-OldVI", old_vi])

    subprocess.call(["taskkill", "/IM", "labview.exe", "/F"])
    try:
        subprocess.check_call(command_args)
    except subprocess.CalledProcessError:
        print('Failed to diff "{0}" and "{1}".'.format(old_vi, new_vi))
        traceback.print_exc()

        with open(output_dir + "\\diff_failures.txt", "a+") as file:
            file.write(new_vi + "\n")


def labview_path_from_year(year):
    env_key = "labviewPath_" + str(year)
    if env_key in os.environ:
        return os.environ[env_key]

    return r"{0}\National Instruments\LabVIEW {1}\LabVIEW.exe".format(
        os.environ["ProgramFiles"], year
    )


def export_repo(target_ref):
    """
    Export a copy of the repository at a given ref to a temporary directory.

    :param target_ref: The ref you want to export, e.g. `origin\main`
    :return: A temporaryfile.TemporaryDirectory containing the repository at the given ref
    """

    directory = tempfile.TemporaryDirectory()
    print(directory)

    shutil.copytree("../../.git", path.join(directory.name, ".git"))
    subprocess.check_call(["git", "checkout", "-f", target_ref], cwd=directory.name)

    @contextmanager
    def cleanup_make_all_writeable(directory):
        try:
            yield directory
        finally:
            # tempfile.TemporaryDirectory has a bug where it fails when readonly files
            # are present. Clearing the readonly flag manually fixes this.
            # When https://bugs.python.org/issue26660 is fixed, this code can be removed,
            # and the temporary directory can be returned directly
            for root, dirs, files in os.walk(directory.name):
                for file in files:
                    os.chmod(root + "/" + file, stat.S_IWRITE)

    return cleanup_make_all_writeable(directory)


def get_changed_labview_files(target_ref):
    """
    Get LabVIEW files which have changed compared to the target ref.

    :param target_ref: The git ref to check for changed files against
    :return: Tuples of the form (status, filename) where status is either "A" or "M", depending on whether the file was added or modified.
    """
    changed_files = git_utilities.get_changed_files(target_ref)

    # https://regex101.com/r/W3riqw/1
    diff_regex = re.compile(r"^(.*\.vi[tm]?)|(.*\.ctl?)$", re.MULTILINE)


    added_labview_files = []
    modified_labview_files = []
    for status, filename in changed_files:
        if re.match(diff_regex, filename):
            if status == 'A':
                added_labview_files.append(filename)
            if status == 'M':
                modified_labview_files.append(filename)

    return added_labview_files, modified_labview_files


def diff_repo(workspace, output_dir, target_branch, lv_version):
    diffs = list(get_changed_labview_files(target_branch))

    # Diffing VIs takes ~1 minute per VI and the stage has a one hour timeout.
    # Limit diff lengths to 60 VIs to avoid using a build node for step that will fail.
    if len(diffs) > 60:
        timeout_message = "More than 60 VIs were modified. Skipping diff pipeline to avoid timeout."
        print(timeout_message)
        with open(output_dir + "\\diff_failures.txt", 'w') as file:
            file.write(timeout_message)
        return

    with export_repo(target_branch) as directory:
        for status, filename in diffs:
            if status == "A":
                print("Diffing added file: " + filename)
                diff_vi(
                    None, path.abspath(filename), path.abspath(output_dir), workspace, lv_version
                )
            elif status == "M":
                print("Diffing modified file: " + filename)
                # LabVIEW won't let us load two files with the same name into memory,
                # so we copy the old file to have a new name. This isn't perfect - the VIs
                # it references will still pull in the new versions of dependencies - but it
                # is better than nothing.
                old_file = path.join(directory.name, filename)
                copied_file = path.join(path.dirname(old_file), "_COPY_" + path.basename(filename))
                shutil.copy(old_file, copied_file)
                diff_vi(
                    copied_file,
                    path.abspath(filename),
                    path.abspath(output_dir),
                    workspace,
                    lv_version,
                )
            else:
                print("Unknown file status: " + filename)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument(
        "workspace",
        help="Directory which contains the `niveristand-custom-device-build-tools` repository "
        "(as opposed to the `niveristand-custom-device-build-tools` repository itself)",
    )
    parser.add_argument("output_dir", help="Directory in which to generate output")
    parser.add_argument(
        "labview_version", help="Year version of LabVIEW you wish to use for diffing"
    )
    parser.add_argument(
        "--target",
        help="Target branch or ref the diff is being generated against",
        default="origin/main",
    )

    args = parser.parse_args()

    diff_repo(args.workspace, args.output_dir, args.target, args.labview_version)
