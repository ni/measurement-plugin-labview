## DMM Measurement 

This is a MeasurementLink example that acquires a single measurement from either NI-DMM or Keysight_34401A DMM.

Select the Pin name as Pin1 to acquire from NI-DMM or select Pin2 to acquire from Keysight_34401A-DMM.
Select the measurement function and range.
Specify the resolution in digits of precision.
  The measured value will be displayed in the Measurement indicator.
  The Boolean indicator will indicate if the measured value is out of range.

### Features

- Uses the NI-DMM LabVIEW API and Agilent_34401A-DMM API.
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
- NI-VISA 2024 Q1 or later
- NI-488.2 and/or NI-Serial
- [Agilent 34401 LabVIEW Plug-and-Play (project style) Instrument Driver](https://sine.ni.com/apps/utf8/niid_web_display.download_page?p_id_guid=014E7F05D12C6F8BE0440003BA7CCD71)

### Required Hardware

This example requires :

- An NI DMM that is supported by NI-DMM (e.g. PXIe-4081).
- Requires an HP/Agilent/Keysight 34401A or compatible DMM.

By default, the pin map included with this example uses the resource name
`GPIB0::22::INSTR`, which matches the 34401A's factory default address when
connected via GPIB. If this doesn't match your configuration, edit [`Keysight
34401A DMM Measurement.pinmap`](./Keysight 34401A DMM Measurement.pinmap) and
replace `GPIB0::22::INSTR` with the desired resource name (e.g. `ASRL1::INSTR`
or a custom alias).

### To simulate NI or Keysight DMM in software

To simulate an NI DMM in software:

- open `NI Hardware Configuration Utility`, click `Edit` -> `Add Hardware...`
- Select the `Simulated` tab, and select any device in the `Digital Multimeters` category.
- You may need to also simulate a PXI chassis (e.g. PXIe-1082) if none exist in the system.

To simulate an Keysight 34001A in software:

We can either simulate through Virtual COM port or VISA-TCP\IP port.

- VISA-TCP\IP simulation:
  
  - Run the `DMM Measurement\DmmMeasurement\HAL\AbstractDMM\Keysight_34401A-DMM\SubVI\Simulate_Keysight_34401a_TCP.vi` with port `50000` and desired timeout in ms.
  - Open `NI-Max` application.
  - Create a new `VISA TCP/IP Resource` under `Devices and Interfaces -> NetworkDevices`.
  - Select `manual entry of raw socket` and click next
  - Now enter the host address as `localhost` and port `50000`.
  - Verify `Validate` opens the port.
  - Enter the alias name as `VISA-DMM`
  - In pin map verify if the custom instrument is named as `VISA-DMM`

- Virtual COM port simulation:
  - Create a `virtual com port pair` called `COM1 and COM2` using the virtual port drivers available online.
  - Now run the `DMM Measurement\DmmMeasurement\HAL\AbstractDMM\Keysight_34401A-DMM\SubVI\Simulate_Keysight_34401a.vi` to simulate the responses.
  - Select `COM2` in this vi before running.
  - In map change the custom instrument name to `COM1`
