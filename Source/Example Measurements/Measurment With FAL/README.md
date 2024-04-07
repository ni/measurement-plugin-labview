## DC Voltage Measurement 

This is a MeasurementLink example that acquires a single voltage measurement from either NI-DMM or NI-DCPower instrument.

Select the Pin name as Pin1 to measure from NI-DMM or select Pin2 to measure from NI-DCPower instrument.
Select the measurement function and range.
Specify the resolution in digits of precision.
  The measured value will be displayed in the Measurement indicator.
  The Boolean indicator will indicate if the measured value is out of range.

### Features

- Uses the NI-DMM LabVIEW API and NI-DCPower instrument API.
- Pin-aware, supporting one session and one pin
  - Uses the same selected measurement function and range for all selected pin/site combinations.
- Includes InstrumentStudio project files
  instrument sessions with the session management service, and run a measurement.
- Uses the NI gRPC Device Server to allow sharing instrument sessions with other 
  measurement services when running measurements from TestStand

### Required Driver Software

- NI-DMM 2023 Q1 or later
- NI-DC Power 2023 Q1 or later

### Required Hardware

This example requires :

- An NI DMM that is supported by NI-DMM (e.g. PXIe-4081).
- NI SMU that is supported by NI-DCPower (e.g. PXIe-4141).


### To simulate NI or DC Power in software

To simulate an NI DMM in software:

- open `NI Hardware Configuration Utility`, click `Edit` -> `Add Hardware...`
- Select the `Simulated` tab, and select any device in the `Digital Multimeters` category.
- You may need to also simulate a PXI chassis (e.g. PXIe-1082) if none exist in the system.
- Check if the instrument name is same as in pin map "DMM1".

To simulate an Keysight 34001A in software:

- open `NI MAX`, right-click `Devices and Interfaces`
- Select `Create New...`, and select `Simulated NI-DAQmx Device or Modular Instrument`.
- SMUs are in the `Power Supplies` category.
- Check if the instrument name is same as in pin map "DCPOWER1".