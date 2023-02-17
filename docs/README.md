# MeasurementLink™ Support for LabVIEW

- [MeasurementLink™ Support for LabVIEW](#measurementlink--support-for-labview)
  - [Introduction](#introduction)
  - [Dependencies](#dependencies)
  - [Software support](#software-support)
  - [Installation](#installation)
  - [Developing a LabVIEW measurement](#developing-a-labview-measurement)
  - [Running a LabVIEW measurement](#running-a-labview-measurement)
  - [Example Measurements](#example-measurements)
    - [Dependencies for the example measurements](#dependencies-for-the-example-measurements)
    - [Running the LDO measurement example](#running-the-ldo-measurement-example)
  - [Using the measurement in InstrumentStudio](#using-the-measurement-in-instrumentstudio)
  - [Creating a LabVIEW executable for static registration](#creating-a-labview-executable-for-static-registration)
  - [Statically registering LabVIEW measurements](#statically-registering-labview-measurements)

---

## Introduction

The MeasurementLink Support for LabVIEW packages enable measurement developers to quickly create LabVIEW measurements and run them as a service(gRPC). MeasurementLink allows users to interact with measurement services with a LabVIEW UI in InstrumentStudio.

---

## Software support

- InstrumentStudio 2023 Q1 or newer
- MeasurementLink 2023 Q1 or newer
- LabVIEW 2020 SP1 or newer
  - JKI VI Package Manager 2020.1 or newer

---

## Installation

1. Install a supported version of InstrumentStudio
2. Install a supported version of MeasurementLink
3. Install a supported version of LabVIEW
4. Download and install the MeasurementLink Support for LabVIEW packages in the following order.
    1. `ni_lib_labview_grpc_library-x.x.x.x.vip` - Required
    2. `ni_lib_labview_grpc_servicer-x.x.x.x.vip` - Required
    3. `ni_measurementlink_service-x.x.x.x.vip` - Required
    4. `ni_measurementlink_generator-x.x.x.x.vip` - Required

---

## Developing a LabVIEW measurement

1. Create a new LabVIEW project (say Measurement.lvproj) and open it.

2. From the project window, go to `Tools` → `MeasurementLink` → `Create Measurement Plug-in...` which opens a new measurement creation dialog.
    - In the new dialog, enter the `Measurement Plug-in Name` that you would like to give to the measurement and click `Create Measurement Plug-in`.

        ![New measurement dialog](images/New%20measurement%20dialog.png)

    - This will create a new measurement service library in the project with the required assets for developing a measurement service.

        ![Measurement library files](images/Measurement%20library%20files.png)

3. Add the measurement details in the block diagram of the `Get Measurement Details.vi` including:
    - display name
    - version
    - Service Class

    ![Get Measurement Details VI](images/Get%20Measurement%20Details%20VI.png)

4. Add the required controls for the configuration parameters in the `Measurement Configuration.ctl` file. By default, this comes with `Array in` which is a double array.

    ![Measurement Configurations ctl](images/Measurement%20Configurations%20ctl.png)

5. Add the required indicators for the output parameters in the `Measurement Results.ctl` file. By default, this comes with the `Array out` parameter which is a double array.

    ![Measurement Results ctl](images/Measurement%20Results%20ctl.png)

6. Provide the measurement logic in the `Measurement Logic.vi` block diagram. The diagram has an input cluster including the configuration parameters and an output cluster containing the output parameters from `Measurement Configuration.ctl` and `Measurement Results.ctl`. By default, the logic takes the `Array in` and sends it directly to `Array out`.

    ![Measurement Logic VI](images/Measurement%20Logic%20VI.png)

7. Create the user interface in `Measurement UI.vi` under the `<MeasurementName>.lvlib`. The control and indicator names in the user interface should match the `Measurement Configuration` and `Measurement Results`. If the data type and name match, then the data from the controls will be sent to the `Measurement Logic.vi` and the results will be published to the indicators after the measurement is run. By default, the UI file consists of an 'Array In' control and 'Array Out' indicator.

    ![Measurement UI](images/Measurement%20UI.png)

Note:

- Additional info can be found in the to-do sections in the code, which can be viewed using the `Bookmark Manager`. You can open it from the `View` → `Bookmark Manager` menu. In this window, you can will find the bookmark term `#MeasurementToDo`. Double-clicking on the items will take you to the VI locations where changes need to be made for creating your unique measurement service.
- Scalars (int, double, uint, sint, string, boolean) and double array are the supported datatypes for the `Configuration` and `Output` parameters of the measurement.

---

## Running a LabVIEW measurement

To run the measurement service, follow the steps below

1. Open `<MeasurementName>.lvproj` that contains the Measurement Service library.

2. Start the discovery service if the measurement is to be used in InstrumentStudio.

3. Run the `Run Service.vi` from `<MeasurementName>.lvlib` to start the measurement service.  A new window will appear, which provides basic information about the running service.

    ![Run Service VI](images/Running%20Run%20Service%20VI.png)

4. To manually stop the service, click on the `STOP` button on the window that appeared when the service was started.

---

## Examples

The `Source\Example Measurements` directory contains example measurement services. See the [README.md](../Source/Example%20Measurements/README.md) file there for more information.

---

## Using a measurement in InstrumentStudio

For using LabVIEW measurements, install a supported version of MeasurementLink

To interact with a measurement in InstrumentStudio, follow the steps below:

1. Once all the packages are installed, open InstrumentStudio and click on `Manual Layout`.

2. Choose the desired measurement and create a panel.

    ![Selecting a LabVIEW measurement](images/SelectingMeasurement.png)

3. The layout will be populated with the UI created for the measurement, containing the provided parameters.

4. Provide the required configurations and click `RUN` to run the measurement.

    ![Running the measurement](images/Running%20the%20measurement.png)

---

## Creating a LabVIEW executable for static registration

A Build Specification is included with the generated measurement service. To create an executable for the measurement service, right-click the `<MeasurementName>` build specification and select `Build`.
