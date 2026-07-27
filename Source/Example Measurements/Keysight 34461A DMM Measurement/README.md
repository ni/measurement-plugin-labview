## Keysight 34461A DMM Measurement

This is a measurement plug-in example that performs a DMM measurement using an
HP/Agilent/Keysight 34461A DMM.

### Features

- Further demonstrates how to write a measurement plug-in that uses instrument drivers and NI-VISA
- Pin-aware, supporting a custom instrument type and a single session/pin/site
- Includes InstrumentStudio project file
- Demonstrates how to cancel a running measurement by calling the instrument driver's
  `Device Clear` VI to halt the measurement in progress
- Demonstrates how to use a LabVIEW UI that has external dependencies (dependencies not
  available in the LabVIEW runtime)

### Required Driver Software

- LabVIEW 2021 or later
- NI-488.2 and/or NI-Serial
- NI-VISA 2024 Q1 or later
- [Agilent 3446X Series LabVIEW Plug-and-Play (project style) Instrument Driver](https://sine.ni.com/apps/utf8/niid_web_display.download_page?p_id_guid=DF5B604F4A5037CDE0440021287E6A9E)

### Required Hardware

This example requires an HP/Agilent/Keysight 34461A or compatible DMM.

By default, the pin map included with this example uses the resource name
`USB0::0x2A8D::0x1301::MY53215615::INSTR`, which matches the 34461A's factory default address when
connected via USB. If this doesn't match your configuration, edit [`Keysight
34461A DMM Measurement.pinmap`](./Keysight 34461A DMM Measurement.pinmap) and
replace `USB0::0x2A8D::0x1301::MY53215615::INSTR` with the desired resource name (e.g. `ASRL1::INSTR`
or a custom alias).

### Using a LabVIEW UI with External Dependencies
This example uses a LabVIEW UI with external dependencies. In order to display the
LabVIEW UI in InstrumentStudio, you must first build the `Keysight 34461A DMM Measurement UI`
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
operating system processes. 

## Refactor Process (for swapping 3rd party DMM drivers)

Identified and updated all LabVIEW source files (from the keysight 34401A DMM Measurement.lvproj example project) that required modification to support the Keysight 3446X driver workflow:

  - See Measurement TODO notes for additional context on where to swap driver logic. 
    - Access #MeasurementTodo's from the View → Bookmark Manager menu. 
  - Removed code paths and dependencies that were specific to the original measurement implementation

Addressed instrument driver–related errors:

  - If you run into this error: "(Hex 0xBFFF0015) Timeout expired before operation completed." Alter the Default Instrument Setup.vi in the 3446X Series driver to match the solution in the following KB. 
  - https://knowledge.ni.com/KnowledgeArticleDetails?id=kA03q000000YKn1CAG&l=en-US
  - Ensure that the instrument driver project folder lives in this path --> C:\Program Files\National Instruments\LabVIEW 2025\instr.lib

Bypassed gRPC Device Server logic:

  - Instruments connected via USB: the USB driver will not give up access to the VISA resource. 

This implementation has not been tested with TestStand. 
