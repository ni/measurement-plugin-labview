# MeasurementLink™ Support for LabVIEW

- [MeasurementLink™ Support for LabVIEW](#measurementlink--support-for-labview)
  - [Introduction](#introduction)
  - [Dependencies](#dependencies)
  - [Software support](#software-support)
    - [Supported versions of LabVIEW](#supported-versions-of-labview)
    - [Supported version of InstrumentStudio](#supported-version-of-instrumentstudio)
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

## Dependencies

Set up the following software before installing the given packages.

- VI Package Manager 2020
- LabVIEW 2020 SP1 or newer
- InstrumentStudio - 2023 Q1 or newer
- MeasurementLink - 2023 Q1 or newer

---

## Software support

### Supported versions of LabVIEW

- [LabVIEW 2020(64-bit)](https://www.ni.com/en-us/support/downloads/software-products/download.labview.html#345658)
- [LabVIEW 2020 SP1(64-bit)](https://www.ni.com/en-us/support/downloads/software-products/download.labview.html#369659)
- [LabVIEW 2021(64-bit)](https://www.ni.com/en-us/support/downloads/software-products/download.labview.html#411431)
- [LabVIEW 2021 SP1(64-bit)](https://www.ni.com/en-us/support/downloads/software-products/download.labview.html#443865)

### Supported version of InstrumentStudio

- InstrumentStudio 2023 Q1 or newer

---

## Installation

1. Install a supported version of InstrumentStudio
2. Install a supported version of MeasurementLink
3. Download and install the MeasurementLink Support for LabVIEW packages in the following order.
    1. `ni_lib_labview_grpc_library-x.x.x.x.vip` - Required
    2. `ni_lib_labview_grpc_servicer-x.x.x.x.vip` - Required
    3. `ni_measurementlink_service-x.x.x.x.vip` - Required
    4. `ni_measurementlink_generator-x.x.x.x.vip` - Required

---

## Developing a LabVIEW measurement

1. Create a new LabVIEW project (say Measurement.lvproj) and open it.

2. From the project window, go to `Tools` → `MeasurementLink` → `Create Measurement Service...` which opens a new measurement creation dialog.
    - In the new dialog, enter the `Measurement Service Name` that you would like to give to the measurement and click `Create Measurement Service`.

        ![New measurement dialog](images/New%20measurement%20dialog.png)

    - This will create a new measurement service library in the project with the required assets for developing a measurement service.

        ![Measurement library files](images/Mesurement%20library%20files.png)

3. Add the measurement details in the block diagram of the `Get Measurement Details.vi` including:
    - display name
    - version
    - measurement type
    - product type
    - service id

    ![Get Measurement Details VI](images/Get%20Measurement%20Details%20VI.png)

4. Add the required controls for the configuration parameters in the `Measurement Configuration.ctl` file. By default, this comes with `Array in` which is a double array.

    ![Measurement Configurations ctl](images/Measurement%20Configurations%20ctl.png)

5. Add the required indicators for the output parameters in the `Measurement Results.ctl` file. By default, this comes with the `Array out` parameter which is a double array.

    ![Measurement Results ctl](images/Measurement%20Results%20ctl.png)

6. Provide the measurement logic in the `Measurement Logic.vi` file. This file will have the configuration and the output parameters readily available from `Measurement Configuration.ctl` and `Measurement Results.ctl`. By default, the logic takes the `Array in` and stores it in `Array out`.

    ![Measurement Logic VI](images/Measurement%20Logic%20VI.png)

7. Create the user interface in `Measurement UI.vi` under the `<LibraryName>.lvlib\`. The control and indicator names in the user interface should match the `Measurement Configuration` and `Measurement Results`. If the data type and name match, then the data from the UI will send to the logic before execution, and the results will be published to UI after the measurement is run. By default, the UI file consists of an 'Array In' control and 'Array Out' indicator.

    ![Measurement UI](images/Measurement%20UI.png)

Note:

- Additional info could be found in the to-do sections in the code, this can be viewed using `Bookmark Manager` - You can open it from LabVIEW → `View` → `Bookmark Manager`. In this window, you can find the bookmark term `#MeasurementToDo`, double-clicking on the items will take you to all the VIs where changes can be done to create a measurement.
- Scalars(int, double, uint, sint, string, boolean) and DoubleArray are the supported datatypes for the `Configuration` and `Output` parameters of the measurement.

---

## Running a LabVIEW measurement

To run the measurements, follow the below steps

1. Open `<MeasurementName>.lvproj` that contains the Measurement Service library.

2. Start the discovery service if the measurement is to be used in InstrumentStudio.

3. Run the `Run Service.vi` from `<MeasurementName>.lvlib` to run the measurement service from `<MeasurementName>.lvproj`

4. To manually stop the service, click on the `Stop` button from the front panel of `Run Service.vi`.

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

4. Provide the required configurations and click `Run` to run the measurement.

    ![Running the measurement](images/Running%20the%20measurement.png)

---

## Creating a LabVIEW executable for static registration

To create an executable for the measurement service project follow the steps provided below,

1. After creating a measurement service, right-click on the `Build Specifications` of the LabVIEW project and select `New`→`Application(EXE)`.

    ![Build Specifications menu](images/Build%20Specifications%20Selection.png)

2. In the `My Application Properties` dialog, provide the necessary details in the  `Information` section.

    ![Build Information Settings](images/Build%20Information.png)

3. Move to the `Source Files` section and set up the `Run Service.vi` as the startup VI. Move all the other files of the measurement library into the `Always Included` section.

    ![Source File Settings](images/Source%20File%20Settings.png)

4. Navigate to the `Pre/Post Build Actions` section and enable the `Execute VI after build` check box.
5. Select the `Post Build Action. vi` from the `Build Assets` folder that is present in the project.

    ![Post-Build VI selection](images/Post%20build%20vi%20selection.png)

6. Click on `Build` and the desired executable with its required dependencies will be created.

    ![Generated EXE files](images/Generated%20EXE%20Files.png)

---

## Statically registering LabVIEW measurements

- Refer to the Static Registration of measurements Readme for statically registering measurements.
- To create a LabVIEW executable refer to [Creating a LabVIEW executable for the static registration](#creating-a-labview-executable-for-static-registration) section.
