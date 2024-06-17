## Keysight 34401A DMM Measurement

This is a measurement plug-in example that performs a DMM measurement using an
HP/Agilent/Keysight 34401A DMM.

### Features

- Demonstrates how to write a measurement plug-in that uses instrument drivers and NI-VISA
- Pin-aware, supporting a custom instrument type and a single session/pin/site
- Includes InstrumentStudio project file
- Includes a TestStand sequence showing how to configure the pin map, register
  instrument resources with the session management service, and run a measurement
  - For the sake of simplicity, the TestStand sequence handles pin map and session
    registration and unregistration in the `Setup` and `Cleanup` sections of the main
    sequence. For **Test UUTs** and batch process model use cases, these steps should
    be moved to the `ProcessSetup` and `ProcessCleanup` callbacks.
- Demonstrates how to share instrument resources with other measurement services
  when running measurements from TestStand, without using NI gRPC Device Server
- Demonstrates how to cancel a running measurement by calling the instrument driver's
  `Device Clear` VI to halt the measurement in progress
- Demonstrates how to use a LabVIEW UI that has external dependencies (dependencies not
  available in the LabVIEW runtime)

### Required Driver Software

- LabVIEW 2021 or later
- NI-488.2 and/or NI-Serial
- NI-VISA 2024 Q1 or later
- [Agilent 34401 LabVIEW Plug-and-Play (project style) Instrument Driver](https://sine.ni.com/apps/utf8/niid_web_display.download_page?p_id_guid=014E7F05D12C6F8BE0440003BA7CCD71)

### Required Hardware

This example requires an HP/Agilent/Keysight 34401A or compatible DMM.

By default, the pin map included with this example uses the resource name
`GPIB0::22::INSTR`, which matches the 34401A's factory default address when
connected via GPIB. If this doesn't match your configuration, edit [`Keysight
34401A DMM Measurement.pinmap`](./Keysight 34401A DMM Measurement.pinmap) and
replace `GPIB0::22::INSTR` with the desired resource name (e.g. `ASRL1::INSTR`
or a custom alias).

### Using a LabVIEW UI with External Dependencies
This example uses a LabVIEW UI with external dependencies. In order to display the
LabVIEW UI in InstrumentStudio, you must first build the `Keysight 34401A DMM Measurement UI`
packed library build specification. The packed library and its containing directory will
have all of the dependencies that the UI needs to load in InstrumentStudio.

If you make changes to `Measurement UI.vi`, you must rebuild the packed library.

### Session Management

This example has a slightly different approach to session management than the
examples for NI PXI modular instruments.

The examples for NI PXI modular instruments use the NI gRPC Device Server to
share a single driver session between multiple operating system processes. When running
measurements outside of TestStand, each measurement re-initalizes the
instrument. When running measurements in TestStand, the `ProcessSetup` callback
initializes the instrument once per sequence execution, which avoids
the overhead of re-initializing the instrument for each measurement.

This example does not use NI gRPC Device Server. The measurement logic and
TestStand code module open and close instrument sessions as needed in multiple
operating system processes. However, the instrument initialization behavior is
the same as before: outside of TestStand, each measurement re-initializes the
instrument; in TestStand, the `ProcessSetup` callback initalizes the instrument
once per sequence execution. This approach works for instruments connected via
GPIB or serial because multiple processes (TestStand, multiple measurement
services) can connect to the same instrument without resetting any instrument
state.

In both cases, the `ProcessSetup` callback registers the instrument with the
session management service, the measurement logic uses the session management
service to reserve and unreserve the instrument, and the `ProcessCleanup`
callback unregisters the instrument with the session management service. This
ensures that only one measurement at a time has access to the instrument.
