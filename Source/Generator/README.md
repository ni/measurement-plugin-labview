# Measurements Template

This repo contains the LabVIEW Measurement template code

## Dependency List

1. LabVIEW 2020 64 bit
2. [LabVIEW gRPC Support](https://github.com/ni/grpc-labview/releases) This repo contains the support for LabVIEW gRPC. We include these grpc-labview packages with our release. Download and install the versions included with the release of `meaurementlink-labview` you are using:
    1. ni_lib_labview_grpc_library-x.x.x.x.vip
    2. ni_lib_labview_grpc_servicer-x.x.x.x.vip

## Developer Guide

### Instantiate a New Measurement

1. Create a new LabVIEW project (say `Measurement.lvproj`) and open it.
2. From the project window, select `Tools` -> `MeasurementLink` -> `Create Measurement Plug-in...`
3. In the dialog that appears, enter the `Measurement Plug-in Name` that you would like to give to the measurement, then click `Create Measurement Plug-in`. This will create a new measurement service plug-in library in the project.

### Run the Measurement Service

To run the measurements, follow the below steps

1. Open `<MeasurementName>.lvproj` that contains the measurement service library.
2. Run the `Run Service.vi` from `<MeasurementName>.lvlib` to run the measurement service from `<MeasurementName>.lvproj`

### Stop the Measurement Service

To stop the service manually, click on the `STOP` button on th `Run Service.vi` front panel.

### Make changes to the Measurement

The measurement service code has some basic TODO notes on the changes that need to be made for a new measurement. These can be viewed using the `Bookmark Manager` - You can open it from the `View` -> `Bookmark Manager` menu in LabVIEW. In this window, you can find the bookmark term `#MeasurementToDo`. Double-clicking on the items will take you to the locations in the VIs that need to be changed for your unique measurement service.

#### Make Changes to the Measurement Logic

Measurement Logic for the measurement service is located in `Measurement Logic.vi` under the measurement library. After modifying the measurement logic, run the measurement by following the `Run the Measurement Service` steps from above.

#### How to add new UI elements

The User Interface for a measurement service is defined by the front panel of `Measurement UI.vi` under the `<MeasurementName>.lvlib`. The control and indicator labels on the front panel should match the `Measurement Configuration` and `Measurement Results`. If the datatype and name matches, data from the front panel controls will be sent to the logic before execution and the results will be published to the front panel indicators after the measurement is run.
