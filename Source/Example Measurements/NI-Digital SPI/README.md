## NI-Digital Pattern Burst

This is a MeasurementLink example that bursts a simple pattern with NI-Digital.

### Features

- Uses the NI-Digital LabVIEW API
- Pin-aware, supporting one session and multiple pins
  - Bursts a pattern on all pins in the pattern.
  - Captures and displays HRAM results for all pins in the pattern.
- Includes Digital Pattern Editor and MeasurementLink UI Editor project files
- Includes multiple UI files. Note: InstrumentStudio only displays the 1st UI file.
  To change the UI file used for the example, switch the order of the array elements
  in `Get UI Details.vi`
- Includes a TestStand sequence showing how to configure the pin map, register
  instrument sessions with the session management service, and run a measurement.
  - For the sake of simplicity, the TestStand sequence handles pin map and session registration and unregistration in the `Setup` and `Cleanup` sections of the main sequence. For **Test UUTs** and batch process model use cases, these steps should be moved to the `ProcessSetup` and `ProcessCleanup` callbacks.
- Uses the NI gRPC Device Server to allow sharing instrument sessions with other
  measurement services when running measurements from TestStand

### Required Driver Software

- NI-Digital 2023 Q1 or later

### Required Hardware

This example requires a digital pattern device that is supported by NI-Digital (e.g. PXIe-6570).