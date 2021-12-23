# Measurement Services Support for LabVIEW

This repo contains the necessary LabVIEW client/server, template, and examples to call into the Measurement Services.

## Dependency List
1. LabVIEW 2020 64 bit (some of the libraries are from LabVIEW 2019 64bit yet)
2. [LabVIEW gRPC Support](https://github.com/ni/grpc-labview/releases)
This repo contains the support for LabVIEW gRPC. Download and install the two latest release packages for,
2.1 ni_lib_labview_grpc_library-x.x.x.x.vip
2.2 ni_lib_labview_grpc_servicer-x.x.x.x.vip

## Libraries Maintained in this repo

### Discovery Client
The Discovery Client registers and unregisters the measurement services to the Discovery Service and enumerates previously registered measurement services. All the measurements (service) will be registered to the Discovery Service (statically or dynamically), so that Client application can enumerate them.

This repo is dependent on 1 & 2.1 from above dependency list.

TODO: include the link to build procedure

### Measurement Service Template
This repo contains the Measurement Service template, which has predefined functions to publish the meta data and make measurement operations. This also contains placeholder for measurement developers to add the measurement logic and meta data.

Measurement developers can instantiate a measurement from the template using the "Measurement Instantiation Tool". This repo is dependent on 1, 2.1, 2.2 from above dependency list and the built library of "Discovery Client".

TODO: include the link to build procedure


### Measurement Instantiation Tool
This repo contains the Script tool to instantiate a measurement from the "Measurement Service Template". This is dependent on 1 and built library of "Measurement Service Template".

TODO: include the link to build procedure
TODO: includes instructions for launching the tool after installation.

### "Measurement Service" Client
This repo contains the client library for the "Measurement Service" that enables communication with the Measurement Service to Get Meta Data or Trigger Measurements.

TODO: include the link to build procedure

### InstrumentStudio G Plugin for Measurement Service
This repo contains the code for InstrumentStudio G Plugin that acts as a interface of enumerating the Measurement Service using the Discovery Client, and displaying a selected Measurement Service for users to make measurement interactively. This is dependent on 1, 2.1 from above dependency list and the built library of "Discovery Client", "Measurement Service Client".

TODO: include the link to build procedure
TODO: include the instruction to load and configure the G Plugin in InstrumentStudio

### Measurement Service Examples
This repo contains example measurement routines developed using the "Measurement Service template". This is dependent on 1, 2.1, 2.2 from above dependency list and the built library of "Discovery Client".

TODO: include instructions for opening/using examples

