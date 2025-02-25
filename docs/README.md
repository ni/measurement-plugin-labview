# Measurement Plug-In SDK for LabVIEW

- [Measurement Plug-In SDK for LabVIEW](#measurement-plug-in-sdk-for-labview)
  - [Introduction](#introduction)
  - [Software support](#software-support)
  - [Installation](#installation)
  - [Developing a LabVIEW measurement](#developing-a-labview-measurement)
  - [Running a LabVIEW measurement](#running-a-labview-measurement)
  - [Generating a LabVIEW measurement client](#generating-a-labview-measurement-client)
    - [Generating a LabVIEW measurement client programmatically](#generating-a-labview-measurement-client-programmatically)
  - [Running a LabVIEW measurement client](#running-a-labview-measurement-client)
  - [Examples](#examples)
  - [Using a measurement in InstrumentStudio](#using-a-measurement-in-instrumentstudio)
  - [Creating a LabVIEW executable for static registration](#creating-a-labview-executable-for-static-registration)

---

## Introduction

The Measurement Plug-In SDK for LabVIEW packages enable measurement developers
to quickly create LabVIEW measurements and run them as a service. They also allow developers
to generate a LabVIEW client which communicates with the service over gRPC. NI Measurement
Plug-In Support allows users to interact with measurement services with a
LabVIEW UI in InstrumentStudio.

---

## Software support

- InstrumentStudio 2024 Q3 or later
- LabVIEW 2021 SP1 or later
  - JKI VI Package Manager 2021 SP1 or later

---

## Installation

1. Install a supported version of
   [InstrumentStudio](https://www.ni.com/en/support/downloads/software-products/download.instrumentstudio.html#494650)
2. Install a supported version of
   [LabVIEW](https://www.ni.com/en/support/downloads/software-products/download.labview.html#487445)
3. Install a supported version of [Measurement Plug-In SDK for
   LabVIEW](https://www.ni.com/docs/en-US/bundle/measurementplugins/page/labview-measurement-dependencies.html)
   from VIPM.

---

## Developing a LabVIEW measurement

1. Create and save a new LabVIEW project.

2. From the project window, go to `Tools` → `Plug-In SDKs` → `Measurements` → `Create
   Measurement Plug-in...`.
    - In the dialog, enter the `Measurement Plug-in Name` and `Measurement Plug-in Description`, then click `Create Measurement Plug-in`.

        ![New measurement dialog](images/New%20measurement%20dialog.png)

    - This will create a new measurement service library and a UI library.

        ![Measurement library files](images/Measurement%20library%20files.png)

3. Add the measurement details to `Get Service Descriptor.vi`.

    ![Get Service Descriptor VI](images/Get%20Service%20Descriptor%20VI.png)

4. Add the required configuration parameters to `Measurement Configuration.ctl`.
   By default, there are controls showing most of the supported data types.

    ![Measurement Configurations ctl](images/Measurement%20Configurations%20ctl.png)

5. Add the required output parameters to `Measurement Results.ctl`. By default,
   there are indicators for most of the supported data types.

    ![Measurement Results ctl](images/Measurement%20Results%20ctl.png)

6. Add your measurement logic to `Measurement Logic.vi`. The VI has an input
   cluster with the configuration parameters from `Measurement
   Configuration.ctl` and an output cluster with the output parameters from
   `Measurement Results.ctl`. By default, the measurement logic takes the inputs
   and writes them to the associated outputs (a loopback measurement).

    ![Measurement Logic VI](images/Measurement%20Logic%20VI.png)

7. Add your user interface to `Measurement UI.vi`. The control and indicator
labels in the user interface must match the `Measurement Configuration` and
`Measurement Results` labels. If the data types and labels match, then the data
from the controls will be sent to the `Measurement Logic.vi` and the results
will be published to the indicators after the measurement is run. By default,
the UI file consists of controls and indicators mapped to all of the input and
output parameters for the measurement service. <br/><br/>
If your user interface has dependencies that are not available in the LabVIEW
runtime, you will have to build the UI into a packed library. For example, you
will have to build a packed library if your UI contains VIs from vi.lib or if
your UI depends on user created subVIs or controls. The packed library should be
located in a directory at the same level as `Measurement Logic.vi`. The
measurement template has a build spec for a packed library for the UI
demonstrating how to use a packed library user interface.

    ![Measurement UI](images/Measurement%20UI.png)

Note:

- Additional information can be found in the to-do sections in the code, which
  can be viewed using the `Bookmark Manager`. You can open it from the `View` →
  `Bookmark Manager` menu. In this window, you will find the bookmark term
  `#MeasurementToDo`. Double-clicking on the items will take you to the VI
  locations where changes need to be made for creating your unique measurement
  service.
- A list of supported datatypes for the `Configuration` and `Output` parameters
  of the measurement can be found in the NI Measurement Plug-In Support manual
  [here](https://www.ni.com/docs/en-US/bundle/measurementplugins/page/supported-datatypes.html)

---

## Running a LabVIEW measurement

1. Open your measurement project.

2. Run the `Run Service.vi`.  A new window will appear, which provides basic
   information about the running service.

    ![Run Service VI](images/Running%20Run%20Service%20VI.png)

---

## Generating a LabVIEW measurement client

1. Create and save a new LabVIEW project.

2. From the project window, go to `Tools` → `Plug-In SDKs` → `Measurements` → `Create Measurement Plug-in Client...`.
    - A dialog will open displaying the V2 measurement services that are currently running or deployed on the system.

      ![New measurement client dialog](images/New%20measurement%20client%20dialog.png)

    - In the dialog, select one or more available measurements, then click `Create Measurement Plug-in Client(s)`.

    - This will create a new measurement client library in the project.

      ![Measurement client library files](images/Measurement%20client%20library%20files.png)

### Generating a LabVIEW measurement client programmatically

This facilitates the automation of the measurement client generation in LabVIEW applications, which
helps in invoking measurements within the user application.

- To generate a LabVIEW measurement client programmatically  
  - Open the Block Diagram of your application (or) Create and save a new VI.
  - Navigate to `Measurement I/O` → `Measurement Plug-In SDK` → `Client Generator` → `Generate
    Client.vi` in the palette.

    ![Generate Client VI](images/Generate%20Client%20VI.png)

  - Add the `Generate Client.vi` to the Block diagram.
  - Wire the `service class` name of any available measurement plug-in and a valid `project path` to
    this VI to generate client for the measurement plug-in.
  - By default, the `Generate Client.vi` creates a measurement plug-in client library named after
    the service class.
    - If you want to use a different name for the client library, you can provide a custom name
      through the `client name` input of the VI.

Note:

- The Measurement Plug-In Client is compatible with all datatypes supported by the Measurement Plug-In.
- For Enum datatype, contiguous enums will be represented as enum control
and sparse enums will be represented as ring control in the client.
- If the Measurement Plug-In uses a LabVIEW UI, ring controls in the UI will be represented as numeric controls in the client,
maintaining the same representation.

---

## Running a LabVIEW measurement client

1. Open your measurement client project.

2. For non-pin based measurement, open the `Run Client.vi`.
    - Set the inputs to the configuration control.
    - Run the `Run Client.vi` to invoke the measurement logic and display the results.

      ![Run Client VI](images/Run%20Client%20Template%20VI.PNG)

3. For pin-based measurement
    - Create and save a new VI.
    - Navigate to `Measurement I/O` → `Measurement Plug-In SDK` → `Pin Map` → `Register Pin Map.vi` in the palette.

      ![Register Pin Map VI](images/Register%20Pin%20Map%20VI.png)

    - Drag the `Register Pin Map.vi` to the Block diagram.
    - Wire the Pin Map path of the measurement to this VI to register the Pin Map.
    - Wire the `pin map id` output of this VI to the `pin map context.pin_map_id` input of the Run Client VI.
    - Set the `pin map context.sites` input of the Run Client VI.
    - Set the inputs to the configuration control.
    - Run the `Run Client.vi` to invoke the measurement logic and display the results.

Note:

- To run `Run Client.vi` without registering the pin map for a pin-based measurement,
specify the IOResource name in the configuration control instead of the Pin name.
- The `Run Client.vi` will support both stream and non-stream measurements.
    - For non-stream measurements, `Run Client.vi`  can be used as a standalone VI
    or subVI without any modifications.
    - For stream measurements, when used as a subVI within a framework,
    `Run Client.vi` will only provide the last successful value of the measurement results.
    To obtain all responses from a stream measurement, replicate the logic inside
    `Run Client.vi` within the framework.

---

## Examples

The `Source\Example Measurements` directory contains example measurement
services. See the [README.md](../Source/Example%20Measurements/README.md) file
for more information.

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

The generated measurement service includes two build specifications: one for the
UI and another for the service executable. The UI build specification must be
built first in order for the measurement service executable build to succeed. To
build them, right-click on the desired build specification and choose 'Build'.
