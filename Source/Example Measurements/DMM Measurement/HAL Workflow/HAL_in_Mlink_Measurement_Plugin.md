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
![alt text](<Instrument Class.png>)
2. Copy the class name to string constant in "Get Instrument Type ID.vi of the instrument class.
3. Edit the class attributes in cloned class ctl file to accommodate the instrument specific data if required.
4. Enter the provided interface in string constant in Get Provided Interface and Service Class.vi. This step can be skipped if we are just working on visa instrument, since we are already cloning from a keysight dmm class which also uses visa driver.
5. Edit the `Initialize_Information.ctl` type definition to include the common settings that we will get from `Measurement Logic.vi`. The `Measurment Logic.vi` is the main measurement vi that will cal the hal API's to perform the measurement. Note that this data is expected to come from `Measurment Logic.vi`. So we might need to maintain the common settings that we might expect across different instrument models of same instrument type here. If we include unique instrument settings here we might need to pass it in `Measurment Logic.vi`. But when we want a different instrument model we might need to change the parameters passed in `Measurment Logic.vi`. So if want to configure unique settings we can have it as constant instead of adding it to `Initialize_Information.ctl`.
6. Bundle the initialize settings to the instrument class in `InitializeSessions.vi`.
7. Copy the instrument initialization logic to `Initialize MeasurementLink Session.vi`. This is where instrument driver calls are made to initialize the instrument. Use the `vi.lib\NI-VISA\VISA Open for gRPC Session.vi` instead of normal visa open. Similarly we will have the `gRPC` initialize for other ni instrument drivers.
8. Edit the `Configure_Parameters.ctl` type definition to include configure parameters according to the need. Note that this configuration is expected to come from `Measurment Logic.vi`. So we might need to maintain the common settings that we might expect across different instrument models of same instrument type here. If we include unique instrument settings here we might need to pass it in `Measurment Logic.vi`. But when we want a different instrument model we might need to change the parameters passed in `Measurment Logic.vi`. So if want to configure unique settings we can have it as constant instead of adding it to `Configure_Parameters.ctl`.
9. Edit the `Connection With Session.ctl` type definition to include the specific session reference of the instrument driver. Replace reference control with `session` labelled control.
10. Copy the measurement configuration code to `ConfigureMeasurementParameters.vi`. We will get the configuration data via the variant control from `Measurement Logic.vi`. For instrument reference that is needed for the driver API's we will get from the `Get Connection with session.vi` helper we have under the cloned instrument class.
11. Edit the `Measure.vi` API to do the measurement by calling the corresponding driver API. The API will get the array of string as variant control, which is the pin names for which we will call measure function.
12. Do the instrument specific session close in `Close MeasurementLink Session.vi` API.
13. `(Optional) - ` The `Measurement Logic.vi` under `DmmMeasurement.lvlib` is the main measurement core module. Edit the initialization data, configuration data, measurement data that is converted to variant and sent to instrument model `InitializeSessions.vi`, `ConfigureMeasurementParameters.vi`, `Measure.vi` only if these data are required for all the instrument types.
14. `(Optional) - ` InstrumentStudio UI related changes. Following changes are optionally required based on the users requirement.
    1. Edit the `measurement details` and `description` in `Get Measurement Details.vi` that will appear while we are trying to add manual soft panels into an instrumentstudio project.
    2. Edit the `Get Type Specialization.vi` to include validation for special types in measurement ui that is shown in `Measurement UI.vi`.
    3. Edit `Get UI Details.vi` in case we want to show another vi or measUI file as user interface in instrumentstudio soft panel.
    4. Update the `Measurement Configuration.ctl` in case if the instrument model requires alternative measurement configuration parameters.
    5. Update the `MEasurement Results.ctl` in case the measurement result varies for all instrument models.
    6. Edit the `Measurment UI.vi` to update the user interface that will be displayed in instrumentstudio soft panel.

### Steps to create new instrument model for new instrument type with help of existing HAL libraries

Let's consider a scenario where want implement hardware abstraction for different vendor DC power instruments. In this case we will need some additional steps to follow compare to [Section](#steps-to-create-new-instrument-model-with-help-of-existing-hal-libraries)

1. Each measurement is maintained under a LabVIEW library in a LabVIEW project in MeasurementLink. Since we need different instrument type clone the "[NIDCPowerSourceDCVoltage.lvlib](https://github.com/ni/measurementlink-labview/blob/main/Source/Example%20Measurements/NI-DCPower%20Source%20DC%20Voltage/NI-DCPower%20Measurement/NIDCPowerSourceDCVoltage.lvlib)" into new project, add the [Abtract_Instrument.lvlib](https://github.com/ni/measurementlink-labview/blob/users/prem/dmm-hal-implementation/Source/Example%20Measurements/DMM%20Measurement/DmmMeasurement/HAL/Abstract_Instrument/Base/Abstract_Instrument.lvlib), [InstrumentFactory.lvlib](https://github.com/ni/measurementlink-labview/blob/users/prem/dmm-hal-implementation/Source/Example%20Measurements/DMM%20Measurement/DmmMeasurement/HAL/DMMFactory/DMMFactory.lvlib)" into the new LabVIEW project. Typically instruments that follow same configuration and results can be added into same project. But when a new instrument type is required with different template create new project as mentioned above.
2. Follow steps under [Section](#steps-to-create-new-instrument-model-with-help-of-existing-hal-libraries)

### Steps to migrate HAL implementations from other frameworks

Currently for any new instrument model we don't have any intermediate parent module for specific instrument type. Hence it is enough to follow [section](#steps-to-create-new-instrument-model-with-help-of-existing-hal-libraries) to create fresh instrument model implementation.

Now let's consider there is a HAL implementation in another framework which has its own instrument base class for abstraction. Follow below workflow for porting existing HAL libraries of another framework. This is possible only if the hal libraries are not tightly coupled with any other servers, session management apis and other instrument managers.

1. Create new LabVIEW project.
2. In this case add [Abtract_Instrument.lvlib](https://github.com/ni/measurementlink-labview/blob/users/prem/dmm-hal-implementation/Source/Example%20Measurements/DMM%20Measurement/DmmMeasurement/HAL/Abstract_Instrument/Base/Abstract_Instrument.lvlib), [InstrumentFactory.lvlib](https://github.com/ni/measurementlink-labview/blob/users/prem/dmm-hal-implementation/Source/Example%20Measurements/DMM%20Measurement/DmmMeasurement/HAL/DMMFactory/DMMFactory.lvlib) to the example project.
3. Clone most relatable measurement link instrument example library and add to the project.​
4. Copy the HAL abstraction libraries along with its reusable dependencies to the project.
5. Edit the properties of the HAL abstraction base class from other framework to add [Abstract_Instrument.lvclass](https://github.com/ni/measurementlink-labview/blob/users/prem/dmm-hal-implementation/Source/Example%20Measurements/DMM%20Measurement/DmmMeasurement/HAL/Abstract_Instrument/Base/Abstract_Instrument.lvclass) as the Parent Class.​
6. Create following override methods from Abstract_Instrument to the AHL instrument base class we have.
   1. Initialize MeasurementLink Session.vi
   2. Get Provided Interface and Service Class.vi
   3. Get Instrument Type ID.vi
   4. Close MeasurementLink Session.vi
   5. Measure.vi
   6. ConfigureMeasurementParameters.vi
7. Follow steps under [Section](#steps-to-create-new-instrument-model-with-help-of-existing-hal-libraries)