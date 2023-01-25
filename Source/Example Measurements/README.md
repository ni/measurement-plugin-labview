# Example Measurements

This directory contains these example measurements:

- `CancellableMeasurement`: Demonstrates a simple measurement that takes a specified length of time and can be cancelled while it is running.
- `NI-DMM Measurement`: Performs a DMM measurement using NI-VISA and an NI Instrument Simulator v2.0.

For more details about a specific example, see the `README.md` file included with the example.

## User Guide

### Run the Measurement Service

To run the example measurement, follow these steps

1. Open the LabVIEW project (.lvproj) file for the example.
2. Open and Run the following VI to run the measurement service: `Run Service.vi`

### Stop the Measurement Service

Click the Stop button on the front panel of `Run Service.vi`.

## Developer Guide

### Make Changes to the Measurement Logic

Measurement logic for the measurements is contained in `Measurement Logic.vi` measurement service library.

### How to add new UI elements

The User Interface is defined by `Measurement UI.vi` under `<LibraryName>.lvlib\`. The control and indicator names in the User Interface should match the `Measurement Configuration` and `Measurement Results`. If the datatype and name matches, then the data from the UI will
be sent to the logic before execution and the results will be published to UI after the measurement is run.
