# Regenerating Servers and Clients

Below are instructions for regenerating the grpc-labview code for MeasurementLink servers and clients.

## Setup

- Install LabVIEW 2020 SP1
- Install all `grpc-labview` VI packages from the desired `grpc-labview` [release](https://github.com/ni/grpc-labview/releases)
- Clone the `measurementlink-labview` github repo

## MeasurementLink Discovery Client

The following are instructions for regenerating the Discovery Client.

- Open `\Source\Runtime\Discovery Client.lvproj`
- Delete the entire `MeasurementLink Discovery Client` virtual folder and save the project
- Delete the entire `MeasurementLink Discovery Client` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\Source\Protos\ni\measurementlink\discovery\v1\discovery_service.proto`
    - **Import Paths:** `\Source\Protos`
    - **Prototype Library:** `\Source\Runtime\Discovery Client Prototype Library.lvlib`
    - **Target Project:** `\Source\Runtime\Discovery Client.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `MeasurementLink Discovery`
    - **Generated Library Suffix:** `Client` (make sure to put a space at the beginning)
    - **Generate:** `gRPC Client`
- Run the generator
- Save All and close the project

## MeasurementLink Session Management Client

The following are instructions for regenerating the Session Management Client.

- Open `\Source\Runtime\Session Management Client.lvproj`
- Delete the entire `MeasurementLink Session Management Client` virtual folder and save the project
- Delete the entire `MeasurementLink Session Management Client` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\Source\Protos\ni\measurementlink\sessionmanagement\v1\session_management_service.proto`
    - **Import Paths:** `\Source\Protos`
    - **Prototype Library:** `\Source\Runtime\Session Management Client Prototype Library.lvlib`
    - **Target Project:** `\Source\Runtime\Session Management Client.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `MeasurementLink Session Management`
    - **Generated Library Suffix:** `Client` (make sure to put a space at the beginning)
    - **Generate:** `gRPC Client`
- Run the generator
- Save All and close the project

## MeasurementLink Pin Map Client

The following are instructions for regenerating the Pin Map Client.

- Open `\Source\Runtime\Pin Map Client.lvproj`
- Delete the entire `MeasurementLink Pin Map Client` virtual folder and save the project
- Delete the entire `MeasurementLink Pin Map Client` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\Source\Protos\ni\measurementlink\pinmap\v1\pin_map_service.proto`
    - **Import Paths:** `\Source\Protos`
    - **Prototype Library:** `\Source\Runtime\Pin Map Client Prototype Library.lvlib`
    - **Target Project:** `\Source\Runtime\Pin Map Client.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `MeasurementLink Pin Map`
    - **Generated Library Suffix:** `Client` (make sure to put a space at the beginning)
    - **Generate:** `gRPC Client`
- Run the generator
- Save All and close the project

## MeasurementLink Measurement Server Internal

The following are instructions for regenerating the V1 measurement service.

- Open `\Source\Runtime\Measurement Service V1.lvproj`
- Delete the entire `MeasurementLink Measurement Server Internal` virtual folder and save the project
- Delete the entire `MeasurementLink Measurement Server Internal` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\Source\Protos\ni\measurementlink\measurement\v1\measurement_service.proto`
    - **Import Paths:** `\Source\Protos`
    - **Prototype Library:** (leave blank)
    - **Target Project:** `\Source\Runtime\Measurement Service V1.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `MeasurementLink Measurement`
    - **Generated Library Suffix:** `Server Internal` (make sure to put a space at the beginning)
    - **Generate:** `gRPC Server`
- Run the generator
- From the project, find `MeasurementService.lvclass`. It will be in the `MeasurementLink Measurement Server Internal.lvlib` library
- Right click on the class and select `Rename`
- Rename the class to `MeasurementServiceBaseV1`
- Save All and close the project

## MeasurementLink Measurement Service Base V2

The following are instructions for regenerating the V2 measurement service.

- Open `\Source\Runtime\Measurement Service V2.lvproj`
- Delete the entire `MeasurementLink Measurement Service Base V2` virtual folder and save the project
- Delete the entire `MeasurementLink Measurement Service Base V2` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\Source\Protos\ni\measurementlink\measurement\v2\measurement_service.proto`
    - **Import Paths:** `\Source\Protos`
    - **Prototype Library:** (leave blank)
    - **Target Project:** `\Source\Runtime\Measurement Service V2.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `MeasurementLink Measurement Service Base`
    - **Generated Library Suffix:** `V2` (make sure to put a space at the beginning)
    - **Generate:** `gRPC Server`
- Run the generator
- From the project, find `MeasurementService.lvclass`. It will be in the `MeasurementLink Measurement Service Base V2.lvlib` library
- Right click on the class and select `Rename`
- Rename the class to `MeasurementServiceBaseV2`
- Save All and close the project