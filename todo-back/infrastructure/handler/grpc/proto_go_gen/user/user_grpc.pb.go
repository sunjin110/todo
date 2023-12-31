// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v4.24.2
// source: user/user.proto

package user

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// UserRpcClient is the client API for UserRpc service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type UserRpcClient interface {
	Create(ctx context.Context, in *CreateInput, opts ...grpc.CallOption) (*CreateOutput, error)
	Update(ctx context.Context, in *UpdateInput, opts ...grpc.CallOption) (*UpdateOutput, error)
	Delete(ctx context.Context, in *DeleteInput, opts ...grpc.CallOption) (*DeleteOutput, error)
	Get(ctx context.Context, in *GetInput, opts ...grpc.CallOption) (*GetOutput, error)
	List(ctx context.Context, in *ListInput, opts ...grpc.CallOption) (*ListOutput, error)
}

type userRpcClient struct {
	cc grpc.ClientConnInterface
}

func NewUserRpcClient(cc grpc.ClientConnInterface) UserRpcClient {
	return &userRpcClient{cc}
}

func (c *userRpcClient) Create(ctx context.Context, in *CreateInput, opts ...grpc.CallOption) (*CreateOutput, error) {
	out := new(CreateOutput)
	err := c.cc.Invoke(ctx, "/user.UserRpc/Create", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *userRpcClient) Update(ctx context.Context, in *UpdateInput, opts ...grpc.CallOption) (*UpdateOutput, error) {
	out := new(UpdateOutput)
	err := c.cc.Invoke(ctx, "/user.UserRpc/Update", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *userRpcClient) Delete(ctx context.Context, in *DeleteInput, opts ...grpc.CallOption) (*DeleteOutput, error) {
	out := new(DeleteOutput)
	err := c.cc.Invoke(ctx, "/user.UserRpc/Delete", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *userRpcClient) Get(ctx context.Context, in *GetInput, opts ...grpc.CallOption) (*GetOutput, error) {
	out := new(GetOutput)
	err := c.cc.Invoke(ctx, "/user.UserRpc/Get", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *userRpcClient) List(ctx context.Context, in *ListInput, opts ...grpc.CallOption) (*ListOutput, error) {
	out := new(ListOutput)
	err := c.cc.Invoke(ctx, "/user.UserRpc/List", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// UserRpcServer is the server API for UserRpc service.
// All implementations must embed UnimplementedUserRpcServer
// for forward compatibility
type UserRpcServer interface {
	Create(context.Context, *CreateInput) (*CreateOutput, error)
	Update(context.Context, *UpdateInput) (*UpdateOutput, error)
	Delete(context.Context, *DeleteInput) (*DeleteOutput, error)
	Get(context.Context, *GetInput) (*GetOutput, error)
	List(context.Context, *ListInput) (*ListOutput, error)
	mustEmbedUnimplementedUserRpcServer()
}

// UnimplementedUserRpcServer must be embedded to have forward compatible implementations.
type UnimplementedUserRpcServer struct {
}

func (UnimplementedUserRpcServer) Create(context.Context, *CreateInput) (*CreateOutput, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Create not implemented")
}
func (UnimplementedUserRpcServer) Update(context.Context, *UpdateInput) (*UpdateOutput, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Update not implemented")
}
func (UnimplementedUserRpcServer) Delete(context.Context, *DeleteInput) (*DeleteOutput, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Delete not implemented")
}
func (UnimplementedUserRpcServer) Get(context.Context, *GetInput) (*GetOutput, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Get not implemented")
}
func (UnimplementedUserRpcServer) List(context.Context, *ListInput) (*ListOutput, error) {
	return nil, status.Errorf(codes.Unimplemented, "method List not implemented")
}
func (UnimplementedUserRpcServer) mustEmbedUnimplementedUserRpcServer() {}

// UnsafeUserRpcServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to UserRpcServer will
// result in compilation errors.
type UnsafeUserRpcServer interface {
	mustEmbedUnimplementedUserRpcServer()
}

func RegisterUserRpcServer(s grpc.ServiceRegistrar, srv UserRpcServer) {
	s.RegisterService(&UserRpc_ServiceDesc, srv)
}

func _UserRpc_Create_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateInput)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UserRpcServer).Create(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/user.UserRpc/Create",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UserRpcServer).Create(ctx, req.(*CreateInput))
	}
	return interceptor(ctx, in, info, handler)
}

func _UserRpc_Update_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpdateInput)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UserRpcServer).Update(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/user.UserRpc/Update",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UserRpcServer).Update(ctx, req.(*UpdateInput))
	}
	return interceptor(ctx, in, info, handler)
}

func _UserRpc_Delete_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DeleteInput)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UserRpcServer).Delete(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/user.UserRpc/Delete",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UserRpcServer).Delete(ctx, req.(*DeleteInput))
	}
	return interceptor(ctx, in, info, handler)
}

func _UserRpc_Get_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetInput)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UserRpcServer).Get(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/user.UserRpc/Get",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UserRpcServer).Get(ctx, req.(*GetInput))
	}
	return interceptor(ctx, in, info, handler)
}

func _UserRpc_List_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ListInput)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UserRpcServer).List(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/user.UserRpc/List",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(UserRpcServer).List(ctx, req.(*ListInput))
	}
	return interceptor(ctx, in, info, handler)
}

// UserRpc_ServiceDesc is the grpc.ServiceDesc for UserRpc service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var UserRpc_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "user.UserRpc",
	HandlerType: (*UserRpcServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Create",
			Handler:    _UserRpc_Create_Handler,
		},
		{
			MethodName: "Update",
			Handler:    _UserRpc_Update_Handler,
		},
		{
			MethodName: "Delete",
			Handler:    _UserRpc_Delete_Handler,
		},
		{
			MethodName: "Get",
			Handler:    _UserRpc_Get_Handler,
		},
		{
			MethodName: "List",
			Handler:    _UserRpc_List_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "user/user.proto",
}
