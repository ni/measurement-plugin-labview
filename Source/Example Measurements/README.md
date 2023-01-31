# Example Measurements

This directory contains the following example measurements:

- `CancellableMeasurement`: Demonstrates a simple measurement that takes a specified length of time and can be cancelled while it is running.
- `NI-DCPower Source DC Voltage`: Sources and measures a DC voltage with an NI SMU.

For more details about a specific example, see the `README.md` file included with the example.

## User Guide

### Run the Measurement Service

To run the example measurement, follow these steps

1. Open the LabVIEW project (.lvproj) file for the example.
2. Open and Run the following VI to run the measurement service: `Run Service.vi`
3. For examples that use a pin map, the name of the device in MAX must match the name of the device in the pin map.
4. For examples that have a TestStand sequence, the LabVIEW adapter configuration must be set to use the LabVIEW development system.
See the [TestStand help](https://www.ni.com/docs/en-US/bundle/teststand/page/tsref/infotopics/db_lvadapterconfig.htm) for more details.

### Stop the Measurement Service

Click the Stop button on the front panel of `Run Service.vi`.

## Developer Guide

### Make Changes to the Measurement Logic

Measurement logic for the measurements is contained in `Measurement Logic.vi`.

### How to add new UI elements

The User Interface is defined by `Measurement UI.vi`. The control and indicator names in the User Interface should match the `Measurement Configuration` and `Measurement Results`. If the datatype and name matches, then the data from the UI will
be sent to the logic before execution and the results will be published to UI after the measurement is run.
