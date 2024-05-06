## DMM Measurement 

This is a MeasurementLink example that acquires a single measurement from either NI-DMM or Keysight_34401A DMM by changing the instrument type-id in pinmap file. This is achieved via HAL implementation.

Select the Pin name as Pin1 to measure from NI-DMM or select Pin2 to measure from Keysight_34401A-DMM.
Select the measurement function and range.
Specify the resolution in digits of precision.
The measured value will be displayed in the Measurement indicator.
The Boolean indicator will indicate if the measured value is out of range.

### Features

- Uses the NI-DMM LabVIEW API and Agilent_34401A-DMM API.
- Pin-aware, supporting one session and one pin
  - Uses the same selected measurement function and range for all selected pin/site combinations.
- Includes InstrumentStudio project files
  instrument sessions with the session management service, and run a measurement.
- Uses the NI gRPC Device Server to allow sharing instrument sessions with other 
  measurement services when running measurements from TestStand

### Required Softwares and Drivers

- LabVIEW 64 bit - 2020 or later
- [MeasurementLink VI Packages](https://github.com/ni/measurementlink-labview/releases/tag/v2.1.0.2)
  - LabVIEW gRPC Library - 1.0.1.1
  - LabVIEW gRPC Servicer - 1.0.1.1
  - NI gRPC Types - 1.0.0.1
  - MeasurementLink Service - 2.1.0.2
  - MeasurementLink Generator - 2.1.0.2
- MeasurementLink 2024 Q2
- InstrumentStudio 2024 Q2
- NI-DMM 2023 Q1 or later
- NI-VISA 2024 Q1 or later
- NI-488.2 and/or NI-Serial
- [Agilent 34401 LabVIEW Plug-and-Play (project style) Instrument Driver](https://sine.ni.com/apps/utf8/niid_web_display.download_page?p_id_guid=014E7F05D12C6F8BE0440003BA7CCD71)

### Required Hardware

This example requires :

- An NI DMM that is supported by NI-DMM (e.g. PXIe-4081).
- Requires an HP/Agilent/Keysight 34401A or compatible DMM.
  - By default, the pin map included with this example uses the resource name
  `VISA-DMM`. If this doesn't match your configuration, edit [`Source\Example Measurements\DMM Measurement\DmmMeasurement.pinmap`](./DmmMeasurement.pinmap) and
  replace `VISA-DMM` with the desired resource name (e.g. `ASRL1::INSTR`
  or a custom alias).

### To simulate NI or Keysight DMM in software

To simulate an NI DMM in software:

- open `NI Hardware Configuration Utility`, click `Edit` -> `Add Hardware...`
- Select the `Simulated` tab, and select any device in the `Digital Multimeters` category.
- You may need to also simulate a PXI chassis (e.g. PXIe-1082) if none exist in the system.

To simulate an Keysight 34001A in software:

We can either simulate through Virtual COM port or VISA-TCP\IP port.

- VISA-TCP\IP simulation:
  - Run the `DMM Measurement\DmmMeasurement\HAL\Instruments\Keysight_34401A-DMM\SubVI\Simulate_Keysight_34401a_TCP.vi` with port `50000` and desired timeout in ms.
  - Open `NI-Max` application.
  - Create a new `VISA TCP/IP Resource` under `Devices and Interfaces -> NetworkDevices`.
  - Select `manual entry of raw socket` and click next
  - Now enter the host address as `localhost` and port `50000`.
  - Verify `Validate` opens the port.
  - Enter the alias name as `VISA-DMM`
  - In pin map verify if the custom instrument is named as `VISA-DMM`

- Virtual COM port simulation:
  - Create a `virtual com port pair` called `COM1 and COM2` using the virtual port drivers available online.
  - Now run the `DMM Measurement\DmmMeasurement\HAL\Instruments\Keysight_34401A-DMM\SubVI\Simulate_Keysight_34401a.vi` to simulate the responses.
  - Select `COM2` in this vi before running.
  - In map change the custom instrument name to `COM1`
