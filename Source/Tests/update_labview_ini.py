import sys
import os

def main():
    if len(sys.argv) != 2:
        print("Usage: python update_labview_ini.py <LabVIEWVersion>")
        sys.exit(1)

    labview_version = sys.argv[1]
    ini_filename = fr"C:\Program Files\National Instruments\LabVIEW {labview_version}\LabVIEW.ini"

    # Ensure the directory exists
    if not os.path.exists(os.path.dirname(ini_filename)):
        print(f"Error: LabVIEW directory for version {labview_version} does not exist.")
        sys.exit(1)

    # If the file does not exist, create it
    if not os.path.exists(ini_filename):
        open(ini_filename, 'a').close()

    with open(ini_filename, 'a', encoding='utf-8') as ini_file:
        ini_file.write("\nBrokenVI.LogEveryTimeInIDE=True")

    print(f'Updated {ini_filename} with "BrokenVI.LogEveryTimeInIDE=True"')


main()