# Contributing to MeasurementLink™ LabVIEW Support

Contributions to MeasurementLink LabVIEW Support for  are welcome from all!

MeasurementLink LabVIEW Support is managed via [git](https://git-scm.com), with the canonical upstream
repository hosted on [GitHub](https://github.com/ni/measurement-services-labview/).

MeasurementLink LabVIEW Support follows a pull-request model for development.  If you wish to
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

Procedure to build the repos:

1. All the repo contains a folder called "build spec" which contains a specification file from VIPM.
2. Open the Specification file using VIPM 2020
3. Click Build - Built .vip file will be created in a folder called "build" parallel to "build specs"

## Libraries Maintained in this repo

### Discovery Client

The Discovery Client registers and unregisters the MeasurementLink services to the Discovery Service and enumerates previously registered MeasurementLink services. All the measurements (service) will be registered to the Discovery Service (statically or dynamically), so that Client application can enumerate them.

This repo is dependent on 1 & 2.1 from above dependency list.

TODO: include the link to build procedure

### Measurement Service Template

This repo contains the Measurement Service template, which has predefined functions to publish the metadata and make measurement operations. This also contains placeholder for measurement developers to add the measurement logic and metadata.

Measurement developers can instantiate a measurement from the template using the "Measurement Instantiation Tool". This repo is dependent on 1, 2.1, 2.2 from above dependency list and the built library of "Discovery Client".

For additional details on measurement service template please refer the [measurements template documentation](source/Measurement%20Service%20Template_lv/README.md)

TODO: include the link to build procedure

### Measurement Instantiation Tool

This repo contains the Script tool to instantiate a measurement from the "Measurement Service Template". This is dependent on 1 and built library of "Measurement Service Template".

TODO: include the link to build procedure
TODO: includes instructions for launching the tool after installation.

### Measurement Service Examples

This repo contains example measurement routines developed using the "Measurement Service template". This is dependent on 1, 2.1, 2.2 from above dependency list and the built library of "Discovery Client".

For additional details on examples please refer the [example measurements documentation](source/Example%20Measurements/README.md)

## Testing

- TODO: include testing steps here.

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
for details about how MeasurementLink LabVIEW Support is licensed.
