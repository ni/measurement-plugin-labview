## NI-SCOPE Acquire Waveform

This is a measurement plug-in example that acquires waveforms from an NI SCOPE.

### Features

- Uses the NI-SCOPE LabVIEW API
- Pin-aware, supporting one session and multiple pins
  - Acquires a waveform on each pin specified.
- Includes InstrumentStudio project file
- Includes a TestStand sequence showing how to configure the pin map, register
  instrument sessions with the session management service, and run a measurement.
  - For the sake of simplicity, the TestStand sequence handles pin map and session registration and unregistration in the `Setup` and `Cleanup` sections of the main sequence. For **Test UUTs** and batch process model use cases, these steps should be moved to the `ProcessSetup` and `ProcessCleanup` callbacks.
- Uses the NI gRPC Device Server to allow sharing instrument sessions with other
  measurement services when running measurements from TestStand

### Required Driver Software

- NI-SCOPE 2023 Q1 or later

### Required Hardware

This example requires a device that is supported by NI-SCOPE (e.g. PXIe-5160).

To simulate an NI SCOPE in software: open `NI MAX`, right click `Devices and Interfaces` and select
`Create New...`. Select `Simulated NI-DAQmx Device or Modular Instrument`and click `Finish`. Search for and
select the device you want to simulate and click `OK`. Finally, click on the device and rename it to match
the name in the pin map file (e.g. Scope1).
