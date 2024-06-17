## NI-FGEN Standard Function

This is a measurement plug-in example that generates a waveform using standard function mode with an NI FGEN.

### Features

- Uses the NI-FGEN LabVIEW API
- Pin-aware, supporting one session and one pin
  - Generates the same waveform on all selected pin/site combinations
- Includes InstrumentStudio project file
- Includes a TestStand sequence showing how to configure the pin map, register
  instrument sessions with the session management service, and run a measurement.
  - For the sake of simplicity, the TestStand sequence handles pin map and session registration and unregistration in the `Setup` and `Cleanup` sections of the main sequence. For **Test UUTs** and batch process model use cases, these steps should be moved to the `ProcessSetup` and `ProcessCleanup` callbacks.
- Uses the NI gRPC Device Server to allow sharing instrument sessions with other
  measurement services when running measurements from TestStand

### Required Driver Software

- NI-FGEN 2023 Q1 or later

### Required Hardware

This example requires an NI FGEN that is supported by NI-FGEN (e.g. PXIe-5433).

To simulate an NI FGEN in software: open `NI Hardware Configuration Utility`, click `Edit` -> `Add Hardware...`,
select the `Simulated` tab, and select any device in the `Waveform Generators` category.
You may need to also simulate a PXI chassis (e.g. PXIe-1082) if none exist in the system.
