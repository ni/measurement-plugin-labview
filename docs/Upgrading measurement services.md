# Upgrading from Measurement Plug-In SDK 2.x to Measurement Plug-In SDK 3.0

The Measurement Plug-In SDK 3.0 release includes a large-scale rename and
relocation of client libraries. The primary reason for this was to remove the
usage in library and VI names of `MeasurementLink`, which is no longer being
used as a product name.

These renames will require running a refactoring tool on existing measurement
services to re-link them to the right locations. In order to minimize the effort
required to retrofit code because of these breaks in backward compatibility, an
upgrade script was written that can be used to upgrade projects containing
existing measurement services. To utilize the new script:
1. Install Measurement Plug-In SDK Service and Measurement Plug-In SDK Generator
   3.0 or greater
1. Navigate to and open `<LabVIEW
   Root>/Plug-In SDKs/Measurements/_MeasurementService Utility/RenameRefactor/Refactor
   Dependencies for Projects.vi`
1. Ensure that the `Refactor Data` control is set to `V2 to V3 (July 2024)`
1. Use the `project file or folder (recursive)` control to navigate to a folder
   or specific project containing services written against MeasurementLink 2.0
   that you want to refactor to use Measurement Plug-In SDK 3.0. If you select a
   single project file, then only that single project will be updated. If you
   select a folder, then all projects found recursively under that top level
   directory will be updated
1. Click the run button.

Before running the upgrade utility, it is recommended you make a backup of your
original code should you want to revert back to using MeasurementLink 2.0 for
any reason. The utility has been tested against the shipping examples attached
as release assets to the 2.2.0.2 release.
