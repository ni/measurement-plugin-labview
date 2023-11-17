# Contributing to MeasurementLink™ Support for LabVIEW

Contributions to MeasurementLink Support for LabVIEW are welcome from all!

MeasurementLink Support for LabVIEW is managed via [git](https://git-scm.com), with the canonical upstream
repository hosted on [GitHub](https://github.com/ni/measurement-services-labview/).

MeasurementLink Support for LabVIEW follows a pull-request model for development.  If you wish to
contribute, you will need to create a GitHub account, fork this project, push a
branch with your changes to your project, and then submit a pull request.

Please remember to sign off your commits (e.g., by using `git commit -s` if you
are using the command line client). This amends your git commit message with a line
of the form `Signed-off-by: Name Lastname <name.lastmail@emailaddress.com>`. Please
include all authors of any given commit into the commit message with a
`Signed-off-by` line. This indicates that you have read and signed the Developer
Certificate of Origin (see below) and are able to legally submit your code to
this repository.

See [GitHub's official documentation](https://help.github.com/articles/using-pull-requests/) for more details.

## Getting Started

The repo contains source code and package build specifications to build the two LabVIEW packages for MeasurementLink Support for LabVIEW.

The source code can be found under the `Source` directory and the package definition files (.vipb) can be found under the `Build Specs` directory.

## Building the LabVIEW Packages

The source code is built into two LabVIEW packages

* `ni_measurementlink_service`
* `ni_measurementlink_generator`

To build the packages:

1. Open the desired VIPM specification file (.vipb) under the [`Build Specs`](https://github.com/ni/measurementlink-labview/tree/main/Source/Build%20Specs) folder
2. Open the Specification file using VIPM 2023 or later
3. Click Build - A .vip will be created in the `Build Output` folder under the repo root directory

## `ni_measurementlink_service` Package

The `ni_measurementlink_service` package contains all of the libraries needed for a LabVIEW MeasurementLink service to run. This includes:

### Discovery Client

The Discovery Client is a library which registers and unregisters MeasurementLink services with the Discovery Service and enumerates previously registered MeasurementLink services. All the measurement services must be registered with the Discovery Service (statically or dynamically) so that a client application can enumerate them.

### Pin Map Client

The Pin Map Client is a library which allows applications and services to register a pin map with the pin map service so it can be re-used across applications and services.

### Session Management Client

The MeasurementLink session management service manages driver sessions and driver session access. The driver session management service also allows you to keep driver sessions open and accessible to multiple measurement services while ensuring that only one service has access to a driver session at any given time.

### Measurement Server Libraries

These libraries (MeasurementLink Measurement Server and MeasurementLink Measurement Server Internal) provide shared source code for MeasurementLink services.

## `ni_measurementlink_generator` Package

The `ni_measurementlink_generator` depends on the `ni_measurementlink_service` package and contains these libraries:

### Measurement Service Template

This repo contains the Measurement Service template, which has predefined functions to publish the metadata and perform measurement operations. This also contains a placeholder for measurement developers to add their measurement logic and metadata.

Measurement developers can instantiate a measurement from the template using the "Measurement Instantiation Tool".

For additional details on the measurement service template please refer to the [measurement template documentation](Source/Generator/README.md)

### Measurement Instantiation Tool

This repo contains a tool which creates a measurement from the "Measurement Service Template".

## Measurement Service Examples

This repo contains example measurement services developed using the "Measurement Service Template". They are dependent on the `ni_measurementlink_service` package being installed.

For additional details on examples please refer to the [example measurements documentation](Source/Example%20Measurements/README.md)

## Tests and Test Workflow

This repo contains some [tests](Source/Tests) which verify proper behavior of certain features.  Tests are exercised automatically by a ["Run G Tests"](.github/workflows/run_g_tests.yml) workflow or can also be run manually.

The Test workflow requires that a self-hosted runner be provisioned as follows:
  - Instructions for setting up a [self-hosted runner](https://github.com/ni/measurementlink-labview/settings/actions/runners/new) applied to a machine such that it appears in this repo's [runners list](https://github.com/ni/measurementlink-labview/settings/actions/runners) and includes a `self-hosted` tag.
- Pertinent software installed to the machine, against which the tests will run.  Minimally this might include MeasurementLink and LabVIEW (plus grpc-labview library & servicer .vip packages).
  - As of 3-17-23, runner [spawningpool](https://github.com/ni/measurementlink-labview/settings/actions/runners/21) has an installation comprised of InstrumentStudio 2023 Q1, TestStand 2022 Q4, MeasurementLink 2023 Q1, LabVIEW 2020 SP1 64-bit, and grpc-labview library & servicer 1.0.0.1.
- Additional manual setup on runner:
  - Enable Long Paths via regedit: \[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem\] : "LongPathsEnabled" = 1
  - Enable VI Server in LabVIEW @ `Tools` > `Options...` > `VI Server` > TCP/IP (under "Protocols")
  - (Recommended) Add shortcuts to action-runner script (`run.cmd`), LabVIEW (`LabVIEW.exe`) and MeasurementLink Discovery Service (`NationalInstruments.MeasurementLink.DiscoveryService.exe`) to C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp.

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
for details about how MeasurementLink Support for LabVIEW is licensed.
