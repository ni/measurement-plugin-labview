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

There are 6 session libraries that allow measurement authors to initialize instrument sessions: `niDCPower`, `niDigital`, `niDMM`, `niFGEN`, `niScope`, and `VISA`. You can also write your own session library. The `Keysight 34401A DMM Measurement` example shows how to do this.

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

This repo contains [tests](Source/Tests) which verify proper behavior of certain features.  Tests are exercised automatically by a ["Run G Tests"](.github/workflows/run_g_tests.yml) workflow and can also be run manually.

The test workflow requires a self-hosted runner, which can be configured as follows:
  - Set up a [self-hosted runner](https://github.com/ni/measurement-plugin-labview/settings/actions/runners/new) so that it appears in the repo's [runners list](https://github.com/ni/measurement-plugin-labview/settings/actions/runners) and includes a `self-hosted` tag.
  - Install required software to the machine. Below is the required software with minimum versions.
      - LabVIEW 2020 SP1 64-bit
      - InstrumentStudio 2024 Q3
      - JKI VI Package Manager 2023
          - grpc-labview 1.0.0.1
          - JSONtext 1.7.0.118
      - NI-DCPower 2023 Q3
      - NI-Digital 2023 Q3
      - NI-DMM 2023 Q3
      - NI-FGEN 2023 Q3
      - NI-SCOPE 2023 Q3
      - NI-VISA 2024 Q1
  - Enable Long Paths via regedit: \[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem\] : "LongPathsEnabled" = 1
  - Enable VI Server in LabVIEW @ `Tools` > `Options...` > `VI Server` > TCP/IP (under "Protocols")
  - (Recommended) Add shortcuts to action-runner script (`run.cmd`), LabVIEW (`LabVIEW.exe`) and NI Discovery Service (`NI.Discovery.V1.Service.exe`) to C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp.

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
