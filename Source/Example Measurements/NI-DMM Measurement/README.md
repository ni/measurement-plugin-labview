## NI-DMM Measurement

This is a measurement plug-in example that acquires a single measurement from a NI DMM.


Select the measurement function and range.
Specify the resolution in digits of precision.
  The measured value will be displayed in the Measurement indicator.
  The Boolean indicator will indicate if the measured value is out of range.


### Features

- Uses the NI-DMM LabVIEW API
- Pin-aware, supporting one session and one pin
  - Uses the same selected measurement function and range for all selected pin/site combinations.
- Includes InstrumentStudio project files
- Includes a TestStand sequence showing how to configure the pin map, register
  instrument sessions with the session management service, and run a measurement.
  - For the sake of simplicity, the TestStand sequence handles pin map and session registration and unregistration in the `Setup` and `Cleanup` sections of the main sequence. For **Test UUTs** and batch process model use cases, these steps should be moved to the `ProcessSetup` and `ProcessCleanup` callbacks.
- Uses the NI gRPC Device Server to allow sharing instrument sessions with other
  measurement services when running measurements from TestStand

### Required Driver Software

- NI-DMM 2023 Q1 or later

### Required Hardware

This example requires an NI DMM that is supported by NI-DMM (e.g. PXIe-4081).

To simulate an NI DMM in software:  open `NI Hardware Configuration Utility`, click `Edit` -> `Add Hardware...`,
select the `Simulated` tab, and select any device in the `Digital Multimeters` category.
You may need to also simulate a PXI chassis (e.g. PXIe-1082) if none exist in the system.
