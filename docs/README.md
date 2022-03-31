# LabVIEW Measurement Services

- [LabVIEW Measurement Services](#labview-measurement-services)
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
  - [Using the Measurement Framework plugin in InstrumentStudio](#using-the-measurement-framework-plugin-in-instrumentstudio)

---

## Introduction

The LabVIEW Measurement services enables measurement developers to quickly create LabVIEW measurements and run them as a service(gRPC). Additionally, the `Measurement Framework` plugin allows such measurement services to be hosted in InstrumentStudio to provide an interactive experience.

---

## Dependencies

Set up the following software before installing the given packages.

- VI Package Manager 2020
- LabVIEW.
- Instrument Studio.

---

## Software support

### Supported versions of LabVIEW

- [LabVIEW 2020(64-bit)](https://www.ni.com/en-us/support/downloads/software-products/download.labview.html#345658)
- [LabVIEW 2020 SP1(64-bit)](https://www.ni.com/en-us/support/downloads/software-products/download.labview.html#369659)
- [LabVIEW 2021(64-bit)](https://www.ni.com/en-us/support/downloads/software-products/download.labview.html#411431)
- [LabVIEW 2021 SP1(64-bit)](https://www.ni.com/en-us/support/downloads/software-products/download.labview.html#443865)

### Supported version of InstrumentStudio

- [Instrument Studio 2022 Q1](https://www.ni.com/en-us/support/downloads/software-products/download.instrumentstudio.html#442812)
- [Instrument Studio 2021 Q4](https://www.ni.com/en-us/support/downloads/software-products/download.instrumentstudio.html#428060)

---

## Installation

Download and install the LabVIEW measurement services packages, the installation order is as follows,

1. `labview-measurement-framework-support-for-instrumentstudio-2021_x.x.x-x_windows_x64.nipkg` - Required for using a LabVIEW measurement service in InstrumentStudio
2. `ni_lib_labview_grpc_library-x.x.x.x.vip` - Required
3. `ni_lib_labview_grpc_servicer-x.x.x.x.vip` - Required
4. `ni_lib_discovery_client-x.x.x.x.vip` - Required
5. `ni_lib_labview_measurement_service_template-x.x.x.x.vip` - Required
6. `ni_lib_labview_measurement_service_editor-x.x.x.x.vip` - Required

---

## Developing a LabVIEW measurement

1. Create a new LabVIEW project (say Measurement.lvproj) and open it.

2. From the project window, go to `Tools` → `Measurement Framework` → `Measurement Plugins` → `New...` which opens a new measurement creation dialog.
    - In the new dialog, enter the `Measurement Service Name` that you would like to give to the measurement and click `Create Measurement Service`.

        ![New measurement dialog](images/New%20measurement%20dialog.png)

    - This will create a new measurement service library in the project with the required assets for developing a measurement service.

        ![Measurement library files](images/Mesurement%20library%20files.png)

3. Add the measurement details in the block diagram of the `Get Measurement Details.vi` including:
    - display name
    - version
    - measurement type
    - product type
4. Add the required controls for the configurations parameters in the `Measurement Configuration.ctl` file. By default, this comes with `Array in` which is a double array.

5. Add the required indicators for the output parameters in the `Measurement Results.ctl` file. By default, this comes with `Array out` parameter which is a double array.

6. Provide the measurement logic in the `Measurement Logic.vi` file. This file will have the configuration and the output parameters readily available from `Measurement Configuration.ctl` and `Measurement Results.ctl`. By default, the logic takes the `Array in` and stores it in `Array out`.

7. Create the user interface in `Measurement UI.vi` under the `<LibraryName>.lvlib\`. The control and indicator names in the user interface should match the `Measurement Configuration` and `Measurement Results`. If the datatype and name matches, then the data from the UI will send to the logic before execution and the results will be published to UI after measurement is run. By default, the UI file consists of an 'Array In' control and 'Array Out' indicator.

Note: Additional info could be found in the to-do sections in the code, this can be viewed using `Bookmark Manager` - You can open it from LabVIEW → `View` → `Bookmark Manager`. In this window, you can find the bookmark term `#MeasurementToDo`, double-clicking on the items will take you to all the VIs where changes can be done to create a measurement.

---

## Running a LabVIEW measurement

To run the measurements, follow the below steps

1. Open `<MeasurementName>.lvproj` that contains the Measurement Service library.

2. Start the discovery service if not already started, the discovery service will be automatically started when working with TestStand.

3. Run the `Run Service.vi` from `<MeasurementName>.lvlib` to run the measurement service from `<MeasurementName>.lvproj`

4. To manually stop the service, click on `Stop` button from the front panel of `Run Service.vi`.

---

## Example Measurements

The example measurements provided contains the following projects:

- **LDO measurement**: The project performs simple LDO measurements, the type of LDO measurements performed are:
  - Line Regulation
  - Load Regulation

### Dependencies for the example measurements

1. LabVIEW 2020 64 bit
2. NI-DC Power 21.3
3. NI-DMM 21.3

### Running the LDO measurement example

To run the measurements, follow the steps mentioned below:

1. Open `LDOMeasurements.lvproj` from examples provided.

2. Start the discovery service if not already started, the discovery service will be automatically started when working with TestStand.

3. Run the following VI to run the measurement service from `LDOMeasurements.lvproj`
    -To run Line Regulation, run `Run Service.vi` from `LineRegulation.lvlib`
    -To run Load Regulation, run `Run Service.vi` from `LoadRegulation.lvlib`

4. Use `Measurement Framework` and run the measurements interactively in InstrumentStudio. For more details, please refer to the section [Using the Measurement Framework plugin in InstrumentStudio](#using-the-measurement-framework-plugin-in-instrumentstudio).

Note: The Line and Load regulation measurements have not been tested with real hardware. They have only been tested with the simulated instruments listed above.

---

## Using the Measurement Framework plugin in InstrumentStudio

To host a measurement in InstrumentStudio using the measurement framework plugin, follow the steps mentioned below:

1. Once all the packages are installed, open InstrumentStudio and click on `Manual Layout` and create a large panel for `Measurement Framework`.

    ![Selecting MF large panel](images/Selecting%20MF%20large%20panel.png)

2. Once the layout is loaded click on `Measurement Picker`, which opens a dialog box to select a measurement from the list of available measurements.

3. Choose the desired measurement and click `Ok`.

    ![Picking a measurement](images/Picking%20a%20mesurement.png)

4. The layout will be populated with the UI created for the measurement, containing the provided parameters.

5. Provide the required configurations and click `Run Measurement` to run the measurement.

    ![Running the measurement](images/Running%20the%20measurement.png)
