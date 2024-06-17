## VISA Measurement

This is a measurement plug-in example that shows how to write and read from a serial instrument using VISA.

### Features

- Uses the NI-VISA LabVIEW API.
- Pin-aware, supporting one session and one pin.
- Includes InstrumentStudio project file.
- Includes a TestStand sequence showing how to configure the pin map, register instrument sessions with the session management service, and run a measurement.
  - For the sake of simplicity, the TestStand sequence handles pin map and session registration and unregistration in the `Setup` and `Cleanup` sections of the main sequence. For **Test UUTs** and batch process model use cases, these steps should be moved to the `ProcessSetup` and `ProcessCleanup` callbacks.
- Uses the NI gRPC Device Server to allow sharing instrument sessions with other measurement services when running measurements from TestStand.

### Required Driver Software

- LabVIEW 2021 or later
- NI-VISA 2024 Q1 or later

### Required Hardware

This example requires a COM port and a serial instrument.

You can use simulated COM ports by downloading and installing [com0com](https://com0com.sourceforge.net). This example has a simulator VI called `Simulated Serial Instrument.vi` that you can run using one of the com0com virtual COM ports. The measurement should use the other virtual COM port.
