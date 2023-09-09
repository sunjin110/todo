// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v4.24.2
// source: alive/alive.proto

package alive

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	common "todo-back/infrastructure/handler/grpc/proto_go_gen/common"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// AliveClient is the client API for Alive service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type AliveClient interface {
	Ping(ctx context.Context, in *common.Empty, opts ...grpc.CallOption) (*common.Empty, error)
}

type aliveClient struct {
	cc grpc.ClientConnInterface
}

func NewAliveClient(cc grpc.ClientConnInterface) AliveClient {
	return &aliveClient{cc}
}

func (c *aliveClient) Ping(ctx context.Context, in *common.Empty, opts ...grpc.CallOption) (*common.Empty, error) {
	out := new(common.Empty)
	err := c.cc.Invoke(ctx, "/alive.Alive/Ping", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// AliveServer is the server API for Alive service.
// All implementations must embed UnimplementedAliveServer
// for forward compatibility
type AliveServer interface {
	Ping(context.Context, *common.Empty) (*common.Empty, error)
	mustEmbedUnimplementedAliveServer()
}

// UnimplementedAliveServer must be embedded to have forward compatible implementations.
type UnimplementedAliveServer struct {
}

func (UnimplementedAliveServer) Ping(context.Context, *common.Empty) (*common.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Ping not implemented")
}
func (UnimplementedAliveServer) mustEmbedUnimplementedAliveServer() {}

// UnsafeAliveServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to AliveServer will
// result in compilation errors.
type UnsafeAliveServer interface {
	mustEmbedUnimplementedAliveServer()
}

func RegisterAliveServer(s grpc.ServiceRegistrar, srv AliveServer) {
	s.RegisterService(&Alive_ServiceDesc, srv)
}

func _Alive_Ping_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(common.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AliveServer).Ping(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/alive.Alive/Ping",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AliveServer).Ping(ctx, req.(*common.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

// Alive_ServiceDesc is the grpc.ServiceDesc for Alive service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var Alive_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "alive.Alive",
	HandlerType: (*AliveServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Ping",
			Handler:    _Alive_Ping_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "alive/alive.proto",
}
