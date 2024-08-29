# Regenerating Servers and Clients

Below are instructions for regenerating the grpc-labview code for measurement plug-in servers and clients.

## Setup

- Install LabVIEW 2020 SP1
- Install all `grpc-labview` VI packages from the desired `grpc-labview` [release](https://github.com/ni/grpc-labview/releases)
- Clone the `measurement-plugin-labview` github repo with the `--recursive` option. This will initialize and clone the [ni-apis](https://github.com/ni/ni-apis) submodule located in `Source/Protos/ni-apis`

## Discovery Client

The following are instructions for regenerating the Discovery Client.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\discovery\v1\ni.measurementlink.discovery.v1.api.lvproj`
- Delete the entire `ni.measurementlink.discovery.v1` virtual folder and save the project
- Delete the entire `ni.measurementlink.discovery.v1` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\third_party\ni-apis\ni\measurementlink\discovery\v1\discovery_service.proto`
    - **Import Paths:** (none)
    - **Prototype Library:** `\Source\gRPC\Generated APIs\ni\measurementlink\discovery\v1\ni.measurementlink.discovery.v1.prototype.lvlib`
    - **Target Project:** `\Source\gRPC\Generated APIs\ni\measurementlink\discovery\v1\ni.measurementlink.discovery.v1.api.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `ni.measurementlink.discovery.v1`
    - **Generated Library Suffix:** `.api`
    - **Generate:** `gRPC Client`
- Run the generator
- Save All and close the project

## Session Management Client

The following are instructions for regenerating the Session Management Client.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\sessionmanagement\v1\ni.measurementlink.sessionmanagement.v1.api.lvproj`
- Delete the entire `ni.measurementlink.sessionmanagement.v1.api` virtual folder and save the project
- Delete the entire `ni.measurementlink.sessionmanagement.v1.api` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\third_party\ni-apis\ni\measurementlink\sessionmanagement\v1\session_management_service.proto`
    - **Import Paths:** 
        - `\third_party\protobuf\src`
        - `\third_party\ni-apis\ni\grpcdevice\v1`
        - `\third_party\ni-apis`
    - **Prototype Library:** `\Source\gRPC\Generated APIs\ni\measurementlink\sessionmanagement\v1\ni.measurementlink.sessionmanagement.v1.prototype.lvlib`
    - **Target Project:** `\Source\gRPC\Generated APIs\ni\measurementlink\sessionmanagement\v1\ni.measurementlink.sessionmanagement.v1.api.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `ni.measurementlink.sessionmanagement.v1`
    - **Generated Library Suffix:** `.api`
    - **Generate:** `gRPC Client`
- Run the generator
- Save All and close the project

## Pin Map Client

The following are instructions for regenerating the Pin Map Client.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1\ni.measurementlink.pinmap.v1.lvproj`
- Delete the entire `ni.measurementlink.pinmap.v1.api` virtual folder and save the project
- Delete the entire `ni.measurementlink.pinmap.v1.api` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\Source\Protos\ni\measurementlink\pinmap\v1\pin_map_service.proto`
    - **Import Paths:** (none)
    - **Prototype Library:** `\Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1\ni.measurementlink.pinmap.v1.prototype.lvlib`
    - **Target Project:** `\Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1\ni.measurementlink.pinmap.v1.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `ni.measurementlink.pinmap.v1`
    - **Generated Library Suffix:** `.api`
    - **Generate:** `gRPC Client`
- Run the generator
- Save All and close the project

## Measurement Service Base V1

The following are instructions for regenerating the V1 measurement service.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1\ni.measurementlink.measurement.v1.lvproj`
- Delete the entire `ni.measurementlink.measurement.v1.api` virtual folder and save the project
- Delete the entire `ni.measurementlink.measurement.v1.api` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\Source\Protos\ni\measurementlink\measurement\v1\measurement_service.proto`
    - **Import Paths:** 
        - `\third_party\protobuf\src`
        - `\third_party\ni-apis`
    - **Prototype Library:** (leave blank)
    - **Target Project:** `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1\ni.measurementlink.measurement.v1.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `ni.measurementlink.measurement.v1`
    - **Generated Library Suffix:** `.api`
    - **Generate:** `gRPC Server`
- Run the generator
- From the project, find `MeasurementService.lvclass`. It will be in the `ni.measurementlink.measurement.v1.api.lvlib` library
- Right click on the class and select `Rename`
- Rename the class to `MeasurementServiceBaseV1`
- Save All and close the project

## Measurement Service Base V2

The following are instructions for regenerating the V2 measurement service.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1\ni.measurementlink.measurement.v2.lvproj`
- Delete the entire `ni.measurementlink.measurement.v2.api` virtual folder and save the project
- Delete the entire `ni.measurementlink.measurement.v2.api` on disc
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\Source\Protos\ni\measurementlink\measurement\v2\measurement_service.proto`
    - **Import Paths:** 
        - `\third_party\protobuf\src`
        - `\third_party\ni-apis`
    - **Prototype Library:** (leave blank)
    - **Target Project:** `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1\ni.measurementlink.measurement.v2.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `ni.measurementlink.measurement.v2`
    - **Generated Library Suffix:** `.api`
    - **Generate:** `gRPC Server`
- Run the generator
- From the project, find `MeasurementService.lvclass`. It will be in the `ni.measurementlink.measurement.v2.api.lvlib` library
- Right click on the class and select `Rename`
- Rename the class to `MeasurementServiceBaseV2`
- Save All and close the project
