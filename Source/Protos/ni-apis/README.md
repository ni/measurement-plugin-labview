# `ni-apis`

`ni-apis` is a Git repository containing the public interface definitions for NI
gRPC and REST APIs.

## Using `ni-apis`

### Git Submodules
If your project is in a Git repository that supports Git submodules, you can
include the `ni-apis` respository as a submodule and use the Protobuf compiler
(`protoc`) to generate a client library for your choice of programming language.

## NI Internal NuGet
NI projects can use an internal NuGet to obtain the source of the `ni-apis`
definitions. This NuGet is not available publicly at this time.
Programming-language specific packages are not available at this time.
