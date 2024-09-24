# Regenerating Servers and Clients

Below are instructions for regenerating the grpc-labview code for measurement plug-in servers and clients.

## Setup

- Install LabVIEW 2020 SP1
- Install all `grpc-labview` VI packages from the desired `grpc-labview` [release](https://github.com/ni/grpc-labview/releases)
- Clone the `measurement-plugin-labview` github repo with the `--recursive` option. This will initialize and clone the [ni-apis](https://github.com/ni/ni-apis) and [protobuf](https://github.com/protocolbuffers/protobuf) submodules located in the `third_party` directory
    - Note: If you forget to include the `--recursive` option while cloning, you can still obtain the submodules by doing `git submodule update --init`

## Discovery Client

The following are instructions for regenerating the Discovery Client.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\discovery\v1\ni.measurementlink.discovery.v1.api.lvproj`
- Right-click on the `ni.measurementlink.discovery.v1.api` virtual folder,
  choose `Remove from Project` and save the project
- Delete the existing generated `ni.measurementlink.discovery.v1.api` content on disk
    - Delete the contents of `Source\gRPC\Generated APIs\ni\measurementlink\discovery\v1` except for `ni.measurementlink.discovery.v1.api.lvproj` and `ni.measurementlink.discovery.v1.prototype.lvlib`
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
- Move the generated code up one directory level to avoid long path issues
    - Remove the newly generated library from its virtual folder - right-click on
    `ni.measurementlink.discovery.v1.api.lvlib` and choose Remove from Project
    - On disk, move the contents of `Source\gRPC\Generated APIs\ni\measurementlink\discovery\v1\ni.measurementlink.discovery.v1.api` up one level to `Source\gRPC\Generated APIs\ni\measurementlink\discovery\v1`
    - Delete the `Source\gRPC\Generated APIs\ni\measurementlink\discovery\v1\ni.measurementlink.discovery.v1.api` folder
    - In the project, re-add `Source\gRPC\Generated APIs\ni\measurementlink\discovery\v1\ni.measurementlink.discovery.v1.api.lvlib` to the `ni.measurementlink.discovery.v1.api` virtual folder
- Save All and close the project

## Session Management Client

The following are instructions for regenerating the Session Management Client.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\sessionmanagement\v1\ni.measurementlink.sessionmanagement.v1.api.lvproj`
- Right-click on the `ni.measurementlink.sessionmanagement.v1.api` virtual folder,
  choose `Remove from Project` and save the project
- Delete the existing generated `ni.measurementlink.sessionmanagement.v1.api` content on disk
    - Delete the contents of `Source\gRPC\Generated APIs\ni\measurementlink\sessionmanagement\v1` except for `ni.measurementlink.sessionmanagement.v1.api.lvproj` and `ni.measurementlink.sessionmanagement.v1.prototype.lvlib`
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
- Move the generated code up one directory level to avoid long path issues
    - Remove the newly generated library from its virtual folder - right-click on
    `ni.measurementlink.sessionmanagement.v1.api.lvlib` and choose Remove from Project
    - On disk, move the contents of `Source\gRPC\Generated APIs\ni\measurementlink\sessionmanagement\v1\ni.measurementlink.sessionmanagement.v1.api` up one level to `Source\gRPC\Generated APIs\ni\measurementlink\sessionmanagement\v1`
    - Delete the `Source\gRPC\Generated APIs\ni\measurementlink\sessionmanagement\v1\ni.measurementlink.sessionmanagement.v1.api` folder
    - In the project, re-add `Source\gRPC\Generated APIs\ni\measurementlink\sessionmanagement\v1\ni.measurementlink.sessionmanagement.v1.api.lvlib` to the `ni.measurementlink.sessionmanagement.v1.api` virtual folder
- Save All and close the project

## Pin Map Client

The following are instructions for regenerating the Pin Map Client.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1\ni.measurementlink.pinmap.v1.api.lvproj`
- Right-click on the `ni.measurementlink.pinmap.v1.api` virtual folder,
  choose `Remove from Project` and save the project
- Delete the existing generated `ni.measurementlink.pinmap.v1.api` content on disk
    - Delete the contents of `Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1` except for `ni.measurementlink.pinmap.v1.api.lvproj` and `ni.measurementlink.pinmap.v1.prototype.lvlib`
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\third_party\ni-apis\ni\measurementlink\pinmap\v1\pin_map_service.proto`
    - **Import Paths:** (none)
    - **Prototype Library:** `\Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1\ni.measurementlink.pinmap.v1.prototype.lvlib`
    - **Target Project:** `\Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1\ni.measurementlink.pinmap.v1.api.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `ni.measurementlink.pinmap.v1`
    - **Generated Library Suffix:** `.api`
    - **Generate:** `gRPC Client`
- Run the generator
- Move the generated code up one directory level to avoid long path issues
    - Remove the newly generated library from its virtual folder - right-click on
    `ni.measurementlink.pinmap.v1.api.lvlib` and choose Remove from Project
    - On disk, move the contents of `Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1\ni.measurementlink.pinmap.v1.api` up one level to `Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1`
    - Delete the `Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1\ni.measurementlink.pinmap.v1.api` folder
    - In the project, re-add `Source\gRPC\Generated APIs\ni\measurementlink\pinmap\v1\ni.measurementlink.pinmap.v1.api.lvlib` to the `ni.measurementlink.pinmap.v1.api` virtual folder
- Save All and close the project

## Measurement Service Base V1

The following are instructions for regenerating the V1 measurement service.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1\ni.measurementlink.measurement.v1.api.lvproj`
- Right-click on the `ni.measurementlink.measurement.v1.api` virtual folder,
  choose `Remove from Project` and save the project
- Delete the existing generated `ni.measurementlink.measurement.v1.api` content on disk
    - Delete the contents of `Source\gRPC\Generated
      APIs\ni\measurementlink\measurement\v1` except for
      `ni.measurementlink.measurement.v1.api.lvproj`
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\third_party\ni-apis\ni\measurementlink\measurement\v1\measurement_service.proto`
    - **Import Paths:** 
        - `\third_party\protobuf\src`
        - `\third_party\ni-apis`
    - **Prototype Library:** (leave blank)
    - **Target Project:** `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1\ni.measurementlink.measurement.v1.api.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `ni.measurementlink.measurement.v1`
    - **Generated Library Suffix:** `.api`
    - **Generate:** `gRPC Server`
- Run the generator
- From the project, find `MeasurementService.lvclass`. It will be in the `ni.measurementlink.measurement.v1.api.lvlib` library
- Right click on the class and select `Rename`
- Rename the class to `MeasurementServiceBaseV1`
- Move the generated code up one directory level to avoid long path issues
    - Remove the newly generated library from its virtual folder - right-click on
    `ni.measurementlink.measurement.v1.api.lvlib` and choose Remove from Project
    - On disk, move the contents of `Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1\ni.measurementlink.measurement.v1.api` up one level to `Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1`
    - Delete the `Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1\ni.measurementlink.measurement.v1.api` folder
    - In the project, re-add `Source\gRPC\Generated APIs\ni\measurementlink\measurement\v1\ni.measurementlink.measurement.v1.api.lvlib` to the `ni.measurementlink.measurement.v1.api` virtual folder
- Save All and close the project

## Measurement Service Base V2

The following are instructions for regenerating the V2 measurement service and V2 measurement service client.

- Open `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v2\ni.measurementlink.measurement.v2.api.lvproj`
- Right-click on the `ni.measurementlink.measurement.v2.api` virtual folder,
  choose `Remove from Project` and save the project
- Delete the existing generated `ni.measurementlink.measurement.v2.api` content on disk
    - Delete the contents of `Source\gRPC\Generated
      APIs\ni\measurementlink\measurement\v2` except for
      `ni.measurementlink.measurement.v2.api.lvproj` and `ni.measurementlink.measurement.v2.prototype.lvlib`
- Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
- Fill out the utility as follows:
    - **Proto File Path:** `\third_party\ni-apis\ni\measurementlink\measurement\v2\measurement_service.proto`
    - **Import Paths:** 
        - `\third_party\protobuf\src`
        - `\third_party\ni-apis`
    - **Prototype Library:** (leave blank)
    - **Target Project:** `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v2\ni.measurementlink.measurement.v2.api.lvproj`
    - **Target Name:** `My Computer`
    - **Generated Library Name:** `ni.measurementlink.measurement.v2`
    - **Generated Library Suffix:** `.api`
    - **Generate:** `gRPC Server`
- Run the generator
- From the project, find `MeasurementService.lvclass`. It will be in the `ni.measurementlink.measurement.v2.api.lvlib` library
- Right click on the class and select `Rename`
- Rename the class to `MeasurementServiceBaseV2`
- Move the generated code up one directory level to avoid long path issues
    - Remove the newly generated library from its virtual folder - right-click on
    `ni.measurementlink.measurement.v2.api.lvlib` and choose Remove from Project
    - On disk, move the contents of `Source\gRPC\Generated APIs\ni\measurementlink\measurement\v2\ni.measurementlink.measurement.v2.api` up one level to `Source\gRPC\Generated APIs\ni\measurementlink\measurement\v2`
    - Delete the `Source\gRPC\Generated APIs\ni\measurementlink\measurement\v2\ni.measurementlink.measurement.v2.api` folder
    - In the project, re-add `Source\gRPC\Generated APIs\ni\measurementlink\measurement\v2\ni.measurementlink.measurement.v2.api.lvlib` to the `ni.measurementlink.measurement.v2.api` virtual folder
    - Save the project
- Follow the below instructions to regenerate the V2 measurement service client
    - Open the gRPC Template Creation Utility. `Tools` » `gRPC` » `Open gRPC Server-Client [2] - Code Generator...`
    - Fill out the utility as follows:
        - **Proto File Path:** `\Source\Protos\ni\measurementlink\measurement\v2\measurement_service.proto`
        - **Import Paths:** `\Source\Protos`
        - **Prototype Library:** `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v2\ni.measurementlink.measurement.v2.prototype.lvlib`
        - **Target Project:** `\Source\gRPC\Generated APIs\ni\measurementlink\measurement\v2\ni.measurementlink.measurement.v2.api.lvproj`
        - **Target Name:** `My Computer`
        - **Generated Library Name:** `Measurement Service`
        - **Generated Library Suffix:** ` Client V2`
        - **Generate:** `gRPC Client`
    - Run the generator
    - From the project, find `Measurement Service Client V2.lvlib`. It will be in the `Measurement Service Client V2` virtual folder
    - Move the library under `ni.measurementlink.measurement.v2.api` virtual folder
    - Delete the empty `Measurement Service Client V2` virtual folder
    - Save All and close the project
