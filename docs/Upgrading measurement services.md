# Upgrading from Measurement Plug-In SDK 2.x to Measurement Plug-In SDK 3.0

With the Measurement Plug-In SDK 2.0 release, a number of new client libraries
and APIs have been added to make writing measurement services easier. These
libraries are now installed as part of MeasurementLink™ and can be found on the
functions palette under the "Measurement I/O" category. In many cases, these
APIs replace code that was previously added to the measurement service project
as a helper library when creating the measurement service. 

While these new client libraries reduce the maintenance burden and make writing
measurement services easier, it will require some amount of refactoring to
existing services in order to utilize them. Since it is expected that most
measurements will want to adopt these new libraries, we also used this as an
opportunity to clean up existing APIs so that they are more consistent and
follow standard coding and style guidelines. While relatively minor changes,
these changes break backward compatibility even when not using the new client
APIs. In order to minimize the effort required to retrofit code because of these
breaks in backward compatibility, an upgrade script was written that can be used
to upgrade projects containing existing measurement services. To utilize the new
script:
1. Install MeasurementLink™ 2.0 or greater.
1. Clone this github repo locally.
1. Navigate to and open [Source/Generator/_Editor/RenameRefactor/Refactor Dependencies for Projects.vi](https://github.com/ni/measurementlink-labview/blob/main/Source/Generator/_Editor/RenameRefactor/Refactor%20Dependencies%20for%20Projects.vi)
1. Use the `project file or folder (recursive)` control to navigate to a folder
   or specific project containing services written against MeasurementLink™ 1.x
   that you want to refactor to use MeasurementLink™ 2.0. If you select a single
   project file, then only that single project will be updated. If you select a
   folder, then all projects found recursively under that top level directory
   will be updated.
1. Click the run button.

The `Pack For Grpc.vi` and `Unpack For Grpc.vi` dynamic dispatch VIs changed
name, but only the letter case changed. The upgrade script will properly handle
renaming these VIs on the Windows file system, but your source code control may
not handle case-only renames. If you are using git, you will have to do the
following:
1. Manually change the VI names so that more than just the letter case changed.
   For example, you can rename the VIs `Pack for gRPC_.vi` and `Unpack for
   gRPC_.vi`.
1. Commit your change.
1. Manually change the VI names to the desired names: `Pack for gRPC.vi` and
   `Unpack for gRPC.vi`

Before running the upgrade utility, it is recommended you make a backup of your
original code should you want to revert back to using MeasurementLink™ 1.x for
any reason. The utility has been tested against the shipping examples attached
as release assets to the 1.2.0.4 release.