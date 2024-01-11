# MeasurementLink™ Support for LabVIEW

- [MeasurementLink™ Support for LabVIEW](#measurementlink-support-for-labview)
  - [Introduction](#introduction)
  - [Software support](#software-support)
  - [Installation](#installation)
  - [Developing a LabVIEW measurement](#developing-a-labview-measurement)
  - [Running a LabVIEW measurement](#running-a-labview-measurement)
  - [Examples](#examples)
  - [Using a measurement in InstrumentStudio](#using-a-measurement-in-instrumentstudio)
  - [Creating a LabVIEW executable for static registration](#creating-a-labview-executable-for-static-registration)

---

## Introduction

The MeasurementLink Support for LabVIEW packages enable measurement developers to quickly create LabVIEW measurements and run them as a service. MeasurementLink allows users to interact with measurement services with a LabVIEW UI in InstrumentStudio.

---

## Software support

- InstrumentStudio 2023 Q1 or later
- MeasurementLink 2023 Q1 or later
- LabVIEW 2020 SP1 or later
  - JKI VI Package Manager 2020.1 or later

---

## Installation

1. Install a supported version of [InstrumentStudio](https://www.ni.com/en/support/downloads/software-products/download.instrumentstudio.html#494650)
2. Install a supported version of [MeasurementLink](https://www.ni.com/en/support/downloads/software-products/download.measurementlink.html#494508)
3. Install a supported version of [LabVIEW](https://www.ni.com/en/support/downloads/software-products/download.labview.html#487445)
4. Download and install the [MeasurementLink Support for LabVIEW packages](https://github.com/ni/measurementlink-labview/releases) in the following order.
    1. `ni_lib_labview_grpc_library-x.x.x.x.vip`
    2. `ni_lib_labview_grpc_servicer-x.x.x.x.vip`
    3. `ni_protobuf_types-x.x.x.x.vip`
    4. `ni_measurementlink_service-x.x.x.x.vip`
    5. `ni_measurementlink_generator-x.x.x.x.vip`

---

## Developing a LabVIEW measurement

1. Create and save a new LabVIEW project.

2. From the project window, go to `Tools` → `MeasurementLink` → `Create Measurement Plug-in...`.
    - In the dialog, enter the `Measurement Plug-in Name` and `Measurement Plug-in Description`, then click `Create Measurement Plug-in`.

        ![New measurement dialog](images/New%20measurement%20dialog.png)

    - This will create a new measurement service library.

        ![Measurement library files](images/Measurement%20library%20files.png)

3. Add the measurement details to `Get Measurement Details.vi`.

    ![Get Measurement Details VI](images/Get%20Measurement%20Details%20VI.png)

4. Add the required configuration parameters to `Measurement Configuration.ctl`. By default, there is a single double array called `array in`.

    ![Measurement Configurations ctl](images/Measurement%20Configurations%20ctl.png)

5. Add the required output parameters to `Measurement Results.ctl`. By default, there is a single double array called `array out`.

    ![Measurement Results ctl](images/Measurement%20Results%20ctl.png)

6. Add your measurement logic to `Measurement Logic.vi`. The VI has an input cluster with the configuration parameters from `Measurement Configuration.ctl` and an output cluster with the output parameters from `Measurement Results.ctl`. By default, the measurement logic takes the `array in` and writes it to the `array out`.

    ![Measurement Logic VI](images/Measurement%20Logic%20VI.png)

7. Add your user interface to `Measurement UI.vi`. The control and indicator labels in the user interface must match the `Measurement Configuration` and `Measurement Results` labels. If the data types and labels match, then the data from the controls will be sent to the `Measurement Logic.vi` and the results will be published to the indicators after the measurement is run. By default, the UI file consists of an `array in` control and `array out` indicator.
<br/><br/>
If your user interface has dependencies that are not available in the LabVIEW runtime, you will have to build the UI into a packed library. For example, you will have to build a packed library if your UI contains VIs from vi.lib or if your UI depends on user created subVIs or controls. The packed library should be located in a directory at the same level as `Measurement Logic.vi`. The [Keysight 34401A DMM Measurement](../Source/Example%20Measurements/Keysight%2034401A%20DMM%20Measurement) example demonstrates how to use a packed library user interface. 

    ![Measurement UI](images/Measurement%20UI.png)

Note:

- Additional information can be found in the to-do sections in the code, which can be viewed using the `Bookmark Manager`. You can open it from the `View` → `Bookmark Manager` menu. In this window, you will find the bookmark term `#MeasurementToDo`. Double-clicking on the items will take you to the VI locations where changes need to be made for creating your unique measurement service.
- Scalars (int, double, uint, sint, string, boolean) and double array are the supported datatypes for the `Configuration` and `Output` parameters of the measurement.

---

## Running a LabVIEW measurement

1. Open your measurement project.

2. Run the `Run Service.vi`.  A new window will appear, which provides basic information about the running service.

    ![Run Service VI](images/Running%20Run%20Service%20VI.png)

---

## Examples

The `Source\Example Measurements` directory contains example measurement services. See the [README.md](../Source/Example%20Measurements/README.md) file for more information.

---

## Using a measurement in InstrumentStudio

1. Open InstrumentStudio and click on `Manual Layout`.

2. Choose the desired measurement and create a panel.

    ![Selecting a LabVIEW measurement](images/SelectingMeasurement.png)

3. The layout will be populated with the Measurement UI and the default configuration.

4. Modify the configuration if necessary and click `RUN` to run the measurement.

    ![Running the measurement](images/Running%20the%20measurement.png)

---

## Creating a LabVIEW executable for static registration

A build specification is included with the generated measurement service. To create an executable for the measurement service, right-click the build specification and select `Build`.
