# NI gRPC Device Server APIs

These are APIs for [NI gRPC Device Server](https://github.com/ni/grpc-device/).

These APIs predate the NI gRPC Protocol Buffer Style Guide, so they do not
follow our current conventions and style for `.proto` files. For example, the
files are not organized by package name, and their package names are in a flat
namespace (`nidevice_grpc`, `nidcpower_grpc`, etc.) as opposed to a hierarchy
under the `ni` package.

When you run `protoc` on these APIs or other APIs that depend on them, add
`ni/grpcdevice/v1` to the include path in order to satisfy import directives
such as `import "session.proto"`.