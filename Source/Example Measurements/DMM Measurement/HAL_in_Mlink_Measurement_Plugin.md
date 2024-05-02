# HAL in MeasurementLink examples - Workflow for measurement creation or porting existing HAL

The measurements in MeasurementLink can be easily modified to implement hardware abstraction to switch between different instrument models of same instrument type easily via pinmap file.

A new instrument model can be included with help of existing HAL libraries in the `DmmMeasurement' example or an existing HAL implementation in different framework can be ported.

## Pre-requisites

* Basic MeasurementLink plugin workflow understanding.
* LabVIEW experience.
* Basic understanding of existing HAL implementation in case of porting existing HAL implementation from other framework.

## Existing HAL Helper Libraries in MeasurmentLink

The `DmmMeasurement' example in https://github.com/ni/measurementlink-labview/tree/users/prem/dmm-hal-implementation/Source/Example%20Measurements/DMM%20Measurement repository implements HAL for different dmm instruments.

We can reuse this hal library to implement our own instrument implementation.

The HAL library implementation involves the following modules or classes:

* InstrumentFactory - Finds the instrument class to initialize based on the instrument type id and user interested pins given.
* Abstract_Instrument - The base template for the actual instrument models.
* Instrument Model - The specific instrument model implementations.

## Measurement creation with Hardware Abstraction

### Steps to create new instrument model with help of existing HAL libraries

Let's consider that we are in need to create a measurement for a visa dmm instrument to acquire a single dc voltage. We already have an keysight - 34401A model dmm implementation in the DmmMeasurement example. The following workflow will help us integrate the new dmm instrument model.

1. Clone the "Keysight_34401A-DMM.lvclass" and rename it to necessary name. This name should be used as instrument type id in pin map file.
2. Copy the class name to string constant in "Get Instrument Type ID.vi of the instrument class.
3. Edit the class attributes to include instrument driver api instrument reference, replace it with "instrument_reference" attribute and replace instrument specific settings (serial settings probably like parity).
4. Enter the provided interface in string constant in Get Provided Interface and Service Class.vi. This step can be skipped if we are just working on visa instrument, since we are already cloning from a keysight dmm class which also uses visa driver.
5. Edit the `Initialize_Information.ctl` type definition to include the common settings that we will get from `Measurement Logic.vi`. The `Measurment Logic.vi` is the main measurement vi that will cal the hal API's to perform the measurement.
6. Bundle the initialize settings to the instrument class in `InitializeSessions.vi`.
7. Copy the instrument initialization logic to `Initialize MeasurementLink Session.vi`. This is where instrument driver calls are made to initialize the instrument. Use the `vi.lib\NI-VISA\VISA Open for gRPC Session.vi` instead of normal visa open. Similarly we will have the `gRPC` initialize for other ni instrument drivers.
8. Edit the `Configure_Parameters.ctl` type definition to include configure parameters according to the need. Note that this configuration is expected to come from `Measurment Logic.vi`. So we might need to maintain the common settings that we might expect across different instrument models of same instrument type here. If we include unique instrument settings here we might need to pass it in `Measurment Logic.vi`. But when we want a different instrument model we might need to change the parameters passed in `Measurment Logic.vi`. So if want to configure unique settings we can have it as constant instead of adding it to `Configure_Parameters.ctl`.