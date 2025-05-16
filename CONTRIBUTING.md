# Contributing to Measurement Plug-In SDK for LabVIEW

Contributions to Measurement Plug-In SDK for LabVIEW are welcome from all!

Measurement Plug-In SDK for LabVIEW is managed via [git](https://git-scm.com), with the canonical upstream
repository hosted on [GitHub](https://github.com/ni/measurement-services-labview/).

Measurement Plug-In SDK for LabVIEW follows a pull-request model for development.  If you wish to
contribute, you will need to create a GitHub account, fork this project, push a
branch with your changes, and then submit a pull request.

Please remember to sign off your commits (e.g., by using `git commit -s` if you
are using the command line client). This amends your git commit message with a line
of the form `Signed-off-by: Name Lastname <name.lastmail@emailaddress.com>`. Please
include all authors of any given commit into the commit message with a
`Signed-off-by` line. This indicates that you have read and signed the Developer
Certificate of Origin (see below) and are able to legally submit your code to
this repository.

See [GitHub's official documentation](https://help.github.com/articles/using-pull-requests/) for more details.

## Getting Started

This repo contains source code, package build specifications for building the source into VI packages, and examples showing how to write and run measurement plug-ins.

The source code can be found under the `Source` directory. The package definition files (.vipb) can be found under the `Build Specs` directory. The example code can be found under the `Example Measurements` directory.

## Editing LabVIEW Code

When making changes to LabVIEW code, it is recommended that you use LabVIEW 2024 or later to make edits and save changes. These versions of the editor will automatically detect the presence of the [.lvversion](Source/.lvversion) file in the source directory and save the source in the oldest version of LabVIEW supported by the repo. This requires that all source code submitted to the repo has "Separate compiled code from source file" enabled. For simplicity, this is usually configured at the project or library level. When adding new projects or libraries to the repo, the new libraries and projects should be configured so that this is the default option. Editing VIs outside the context of a project is generally discouraged as a practice as it can lead to accidentally saving VIs for a newer source version than desired or with the incorrect compiled code settings.

### LabVIEW Code Style Guidelines

While this is not intended to be a comprehensive list of all coding conventions, it does call out some of the more important guidelines to retain consistency across this repo.
1. Use book title casing for VI names. 
   - :heavy_check_mark: `My Custom Measurement.vi`
   - :x: `my custom measurement.vi` 
   - :x: `myCustomMeasurement.vi`
   - :x: `MyCustomMeasurement.vi`
   - :x: `my_custom_measurement.vi`
1. Terminal names should be all lower case.
   - :heavy_check_mark: `my terminal name.vi`
   - :x: `My Terminal Name.vi`
1. Control and indicator labels should be placed to the left and right respectively on the block diagram. Consider making this the default behavior by updating block diagram options under the LabVIEW Tools -> Options menu.
1. Do not use icons for front panel terminals on the block diagram. Consider making this the default behavior by updating block diagram options under the LabVIEW Tools -> Options menu.
1. Keep block diagrams neat and tidy. In general, straight "railroad" tracks are preferred when possible. Use `Clean Up Diagram` **(Ctrl + U)** at your discretion to help manage this.
1. All front panels should have the `Clean Up Panel` command **(Ctrl + U)** applied to them. Do not spend time manually aligning the panels to a custom layout unless it is a dialog or some other UI presented to the user.
1. Mark terminals as Required/Recommended as appropriate. Use of Optional terminals is discouraged. It is recommended you change the LabVIEW front panel options so that "Connector pane terminals default to Required" is enabled.
1. Provide a reasonable text icon for all VIs.
1. Be mindful of VI reentrancy settings. This repo utilizes reentrant VIs more than typical LabVIEW code as it is often required to achieve parallelism of multiple RPCs operating in parallel. A single non-reentrant VI in the call chain can destroy this parallelism.
1. Classes should be located under a folder with the same name on disk minus the file suffix.
1. Minimize the public API of classes and libraries by defaulting the access scope to private and community scope. Introduce virtual folders into the project as needed to help manage this. Add friends to classes/libraries as needed for testing to avoid exposing APIs as public that otherwise should not be.
1. All public VIs installed to vilib should have an appropriate VI description filled out for context help purposes. Since there are no detailed help links provided, error on the side of too much documentation rather than too little.
1. "Separate compiled code from source file" should be enabled for all source code.

## Building the LabVIEW Packages

The source code is built into five LabVIEW packages

* `ni_measurement_plugin_sdk`
* `ni_measurement_plugin_sdk_service`
* `ni_measurement_plugin_sdk_generator`
* `ni_measurement_plugin_sdk_examples`
* `ni_protobuf_types`

To build the packages:

1. Open the desired VIPM specification file (.vipb) under the [`Build Specs`](https://github.com/ni/measurement-plugin-labview/tree/main/Source/Build%20Specs) folder
2. Open the Specification file using VIPM 2023 or later
3. Click Build - A .vip will be created in the `Build Output` folder under the repo root directory

## `ni_measurement_plugin_sdk_service` Package

The `ni_measurement_plugin_sdk_service` package contains the libraries needed to run a LabVIEW measurement plug-in.

### Code Generated Libraries

The gRPC Generated API libraries are generated using grpc-labview. They are not meant to be used directly by measurement authors and are not guaranteed to maintain compatibility between releases. For more information on generating these libraries, see the documentation [here](docs/Regenerating%20Server%20and%20Client.md).

### Sessions

There are 6 session libraries that allow measurement authors to initialize instrument sessions: `niDCPower`, `niDigital`, `niDMM`, `niFGEN`, `niScope`, and `VISA`. You can also write your own session library. The `Keysight 34401A DMM Measurement` example shows how to do this. Making edits to any of these driver specific session libraries will require the installation of that specific driver. Similarly, any automated tests that exercise these libraries will also require the driver to be installed or the tests will fail.

### Clients

The `Discovery V1` client library is a wrapper around the generated `ni.measurementlink.discovery.v1.api` library. It implements a higher level starting point for interacting with the Discovery Service. It also implements gRPC client caching. Most of the VIs in this library are private and should not be used by measurement authors.

The `Session Management V1` client library contains the `Session Reservation` class, which allows measurement authors to reserve, initialize, unreserve, and close instrument sessions. It also contains some additional helper classes, which should be considered private.

### TestStand Integration

The `TestStand` library contains a single public VI that allows measurement authors to interact with Plug-In SDK TestStand sequences.

### Measurement Plug-In SDK

The `NI Measurement Plug-In SDK` library contains much of the gRPC service framework. It also contains two public classes: `Measure Call Context` and `Measurement Plugin Service`. The `Measure Call Context` class is an input to the `Measurement Logic.vi` and contains information about the pinmap. It also has methods for reserving sessions, checking for cancelation, and updating measurement results. The `Measurement Plugin Service` class is a base class from which all measurements inherit. This inheritence is mostly hidden form the measurement author and is performed by the measurement generator.

## `ni_measurement_plugin_sdk_generator` Package

The `ni_measurement_plugin_sdk_generator` package contains the libraries needed to create new measurements.

### Measurement Plug-In Template

The `Measurement Plug-In  Template` library contains the VIs and controls that are required for a measurement.

### MeasurementService Editor

The `MeasurementService Editor` library contains the scripting code required to generate a measurement. It starts with the `Measurement Plug-In Template` as the base library and then customizes it for a specific measurement. It also contains a script that can help when updating measurements between incompatible versions. See more details [here.](docs/Upgrading%20to%20Version%202.0.md)

## `ni_measurement_plugin_sdk` Package

This is simply a top-level package that has dependencies on the other `ni_measurement_plugin_sdk_*` packages so installing this should also bring along the other 3 packages.

## `ni_measurement_plugin_sdk_examples` Package

This package contains all of the example projects from the repository. They are installed to the `examples` folder under the LabVIEW root directory.

## `ni_protobuf_types` Package

This package contains common types that are used in measurement plug-ins such as the Waveform and Double XY Data types.

## Examples

This repo contains example measurement services that show how to use the API with NI and 3rd party hardware. For additional details on examples, please refer to the [example measurements documentation.](Source/Example%20Measurements/README.md)

## Tests and Test Workflow

### Manually Running Tests

This repo contains [tests](Source/Tests) which verify proper behavior of certain features.  Tests are exercised automatically by a ["Run G Tests"](.github/workflows/run_g_tests.yml) workflow and can also be run manually. In order to run tests manually using your clone of the repo, you will need to install the following software:
- A 64 bit version of LabVIEW that is >= to the oldest version supported by the repo. The oldest version of LabVIEW supported can be found by looking at the [.lvversion](Source/.lvversion) file in the source directory.
- InstrumentStudio - This installs various support services that are utilized by measurement services. While installing the latest version of InstrumentStudio is the easiest thing to do to ensure compatibility with all tests, older versions of InstrumentStudio will often work fine as the service APIs often remain unchanged between releases.
- VI Package Manager
  - [JSONtext](https://www.vipm.io/package/jdp_science_jsontext) 1.7.0.118
  - [grpc-labview](https://github.com/ni/grpc-labview) - While releases of this package are occasionally published to the VIPM community web site, this repo will often depend on a version that has not been published outside of a release posted on its github repo. The grpc-labview packages required for testing are also included as part of the release assets for each release of this repo. Downloading the VIPM packages attached to the latest release assets to your local system and then installing the local package through VIPM is the recommended way to install this dependency.
- Drivers - If you want to run tests that exercise the session libraries for a specific driver, you will need to install one or more of the following drivers as desired. When installing, be sure to enable the optional "Runtime for LabVIEW Measurement Plug-In Support" feature. The driver versions listed below are the first driver version in which native gRPC support was added to the driver's LabVIEW API. However, as time progresses, the minimum driver version will also depend on the version of LabVIEW which you are using. Refer to the latest documentation on ni.com for information on driver compatibility with your version of LabVIEW.
  - NI-DCPower 2023 Q1
  - NI-Digital 2023 Q2
  - NI-DMM 2023 Q1.1
  - NI-FGEN 2023 Q1.1
  - NI-SCOPE 2023 Q1.1
  - NI-VISA 2024 Q1

Once you have installed the required software, you can run all tests by opening and running [run_tests.vi](Source/Tests/run_tests.vi).  You can also run individual tests by opening the test VI and clicking the run button. 

### Running Automated Tests

Automated testing for the repo is controlled by the ["Run G Tests"](.github/workflows/run_g_tests.yml) workflow and is triggered by pull requests and pushes to the main branch. In addition to the requirements described for manual testing, this workflow utilizes the LabVIEW CLI to run tests and is invoked from the [run_tests.py](Source/Tests/run_tests.py) script. This requires that VI Server is enabled for each version of LabVIEW tested and that unique ports are configured for each LabVIEW version. The self hosted runner used for the workflow is managed internal to NI and utilizes an [AWS AMI](https://forums.ni.com/t5/LabVIEW-Idea-Exchange/Overhaul-the-LabVIEW-Style-Checklist-inside-LabVIEW-help/idi-p/4388337) to execute the tests. When testing against new versions of dependencies is desired or required, the image for the self hosted runner must be updated and redeployed. There is a pipeline internal to NI which can be manually triggered to perform this update. 

The VIPM packages are also part of this self hosted runner image (they are not installed as part of each run of the workflow). The configuration controlling which versions of these packages are installed currently points at assets attached to a release in the repo. So if you want to update the version of `grpc-labview` utilized by automated tests, you will need to:
1. Create a new release for this repo that is exactly the same as the previous release except that newer versions of `grpc-labview` packages are attached to the release. See release [v3.3.1.2](https://github.com/ni/measurement-plugin-labview/releases/tag/v3.3.1.2) as an example of this.
1. Update the internal NI self hosted runner image to point at the packages attached to the release from the previous step and create a PR with these changes.
1. Manually trigger the pipeline to create a new AWS AMI image based on the branch from the previous step. 
1. Wait until the pipeline from the previous step completes and then trigger a new run of the `Run G Tests` workflow to verify nothing was broken with the upgrade to the new dependency versions. If something breaks, debug or rollback as necessary.
1. Complete the PR from step 2 upon verifying there are no issues with the new image.

When making changes that require a new version of `grpc-labview`, it is recommended that you first create a new release that only contains the upgrade of the dependency without any other source changes. There are currently test suites internal to NI that will break if the latest source code is not compatible with the `grpc-labview` version attached to the latest release in the repo.

## Developer Certificate of Origin (DCO)

   Developer's Certificate of Origin 1.1

   By making a contribution to this project, I certify that:

   (a) The contribution was created in whole or in part by me and I
       have the right to submit it under the open source license
       indicated in the file; or

   (b) The contribution is based upon previous work that, to the best
       of my knowledge, is covered under an appropriate open source
       license and I have the right under that license to submit that
       work with modifications, whether created in whole or in part
       by me, under the same open source license (unless I am
       permitted to submit under a different license), as indicated
       in the file; or

   (c) The contribution was provided directly to me by some other
       person who certified (a), (b) or (c) and I have not modified
       it.

   (d) I understand and agree that this project and the contribution
       are public and that a record of the contribution (including all
       personal information I submit with it, including my sign-off) is
       maintained indefinitely and may be redistributed consistent with
       this project or the open source license(s) involved.

(taken from [developercertificate.org](https://developercertificate.org/))

See [LICENSE](https://github.com/ni/measurement-services-labview/blob/master/LICENSE)
for details about how Measurement Plug-In SDK for LabVIEW is licensed.
