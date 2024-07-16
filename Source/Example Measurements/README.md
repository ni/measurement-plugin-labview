# Example Measurements

This directory contains the following example measurements:

- `Game Of Life`: Demonstrates the usage of XY Data in a graph using the Game of
Life. Also demonstrates how to update the measurement UI while the measurement is
running and how to cancel a measurement while it is running.
- `Keysight 34401A DMM Measurement`: Performs a DMM measurement using an
HP/Agilent/Keysight 34401A DMM.
- `Measurement Plug-In Client`: Demonstrates how to write a measurement plug-in client.
Includes an example measurement service.
- `NI-DCPower Source DC Voltage`: Sources and measures a DC voltage with an NI SMU.
- `NI-Digital SPI`: Tests an SPI device using an NI Digital Pattern instrument.
- `NI-DMM Measurement`: Acquires a single measurement from a NI DMM.
- `NI-FGEN Standard Function`: Generates a waveform using standard function mode
  with an NI FGEN.
- `NI-SCOPE Acquire Waveform`: Acquires waveforms from an NI SCOPE.
- `VISA Measurement`: Writes and reads a value from a serial instrument using VISA.

For more details about a specific example, see the `README.md` file included
with the example.

## User Guide

### Run the Measurement Service

To run the example measurement, follow these steps

1. Open the LabVIEW project (.lvproj) file for the example.
2. For examples that use a packed library for the LabVIEW UI, you must first
   build the packed library build specification.
3. Open and Run the following VI to run the measurement service: `Run
   Service.vi`
4. For examples that use a pin map, the name of the device in NI MAX must match
   the name of the device in the pin map.
5. For examples that have a TestStand sequence, the LabVIEW adapter
configuration must be set to use the LabVIEW development system. See the
[TestStand
help](https://www.ni.com/docs/en-US/bundle/teststand/page/tsref/infotopics/db_lvadapterconfig.htm)
for more details.

### Stop the Measurement Service

Click the Stop button on the front panel of `Run Service.vi`.

## Developer Guide

### Make Changes to the Measurement Logic

Measurement logic for the measurements is contained in `Measurement Logic.vi`.

### How to add new UI elements

The User Interface is defined by `Measurement UI.vi`. The control and indicator
names in the User Interface should match the `Measurement Configuration` and
`Measurement Results`. If the datatype and name matches, then the data from the
UI will be sent to the logic before execution and the results will be published
to UI after the measurement is run.
