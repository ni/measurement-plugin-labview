# Example Measurements

This repo contains the example measurements developed using the LabVIEW Measurement service. Below are the list of examples
1. LDO measurement
1.1 Line Regulation
1.2 Load Regulation

## Dependency List
1. LabVIEW 2020 64 bit
2. [LabVIEW gRPC Support](https://github.com/ni/grpc-labview/releases)
This repo contains the support for LabVIEW gRPC. Download and install the two latest release packages for,
  - ni_lib_labview_grpc_library-x.x.x.x.vip
  - ni_lib_labview_grpc_servicer-x.x.x.x.vip
3. NI-DC Power 21.3
4. NI-DMM 21.3

## User Guide

### Run the Measurement Service

To run the measurements, follow the below steps
1. Checkout the `Source\Example Measurements` folder from this repo.
2. Open `LDOMeasurements.lvproj` from `Source\Example Measurements\LDO Measurements`.
3. Run the following VI to run the measurement service from `LDOMeasurements.lvproj`
3.1 To Run Line Regulation, run `Run Service.vi` from `LineRegulation.lvlib`
3.2 To Run Load Regulation, run `Run Service.vi` from `LoadRegulation.lvlib`

### Stop the Measurement Service

Measurement Service will be stopped automaticlly when the client frameworks calls the `ServiceManagementService\Stop Service` method on the Measurement Service. To manually trigger the stop, go to `Run Service.vi` of the respective measurements, and click on `Stop` button from the Front Panel.

## Developer Guide

### Make Changes to the Measurement Logic

Measurement Logic for the measurements are coded under `Measurement Logic.vi` under the respective libraries. The measurement logic can be modified in it. After modifying the measurement logic, run the measurement by following the `Run the Measurement Service` steps from above.

### How GetMetaData and DoMeasure are triggered in the Measurement Service

This is abstracted in the library, and a developer need not know how the frameworks request and recieve the response from the measurement client, and when in measurement client that Get MetaData and Measure functions are called. To understand the Measurement Service please find the details below,

1. To understand the LabVIEW Service and how a service function is called on client call, please refer: https://github.com/ni/grpc-labview/blob/master/docs/BasicsTutorial.md

Measurement Service and the function calls are similar to how the general LabVIEW service works as mentioned in the link above. You can find the `MeasurementService` and `ServiceManagementService` under the `<libraryName>.lvlib\Service\`. 

`MeasurementService` is responsible for responding to the MetaData request and calling the `Measurement Logic.vi` when the DoMeasurement request is sent from the frameworks. These implementation can be found in: `Start Sync.vi`

`ServiceManagementService` is responsible for managing the service like triggering stop event when the framework request to stop the service. These implementation can be found in: `Start Sync.vi`

### How to add new UI elements

User Interface is created in `Measurement UI.vi` under the `<LibraryName>.lvlib\`. The control and indicator names in the User Interface should match the `Measurement Configuration` and `Measurement Results`. If the datatype and name matches, then the data from the UI will sent to the logic before execution and the results will be published to UI after measurement is run.
