// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v4.23.4
// source: alive/alive.proto

package alive

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	common "todo-back/infrastructure/handler/grpc/proto_go_gen/common"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

var File_alive_alive_proto protoreflect.FileDescriptor

var file_alive_alive_proto_rawDesc = []byte{
	0x0a, 0x11, 0x61, 0x6c, 0x69, 0x76, 0x65, 0x2f, 0x61, 0x6c, 0x69, 0x76, 0x65, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x12, 0x05, 0x61, 0x6c, 0x69, 0x76, 0x65, 0x1a, 0x13, 0x63, 0x6f, 0x6d, 0x6d,
	0x6f, 0x6e, 0x2f, 0x63, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x32,
	0x2f, 0x0a, 0x05, 0x41, 0x6c, 0x69, 0x76, 0x65, 0x12, 0x26, 0x0a, 0x04, 0x50, 0x69, 0x6e, 0x67,
	0x12, 0x0d, 0x2e, 0x63, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a,
	0x0d, 0x2e, 0x63, 0x6f, 0x6d, 0x6d, 0x6f, 0x6e, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x22, 0x00,
	0x42, 0x3a, 0x5a, 0x38, 0x74, 0x6f, 0x64, 0x6f, 0x2d, 0x62, 0x61, 0x63, 0x6b, 0x2f, 0x69, 0x6e,
	0x66, 0x72, 0x61, 0x73, 0x74, 0x72, 0x75, 0x63, 0x74, 0x75, 0x72, 0x65, 0x2f, 0x68, 0x61, 0x6e,
	0x64, 0x6c, 0x65, 0x72, 0x2f, 0x67, 0x72, 0x70, 0x63, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x5f,
	0x67, 0x6f, 0x5f, 0x67, 0x65, 0x6e, 0x2f, 0x61, 0x6c, 0x69, 0x76, 0x65, 0x62, 0x06, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x33,
}

var file_alive_alive_proto_goTypes = []interface{}{
	(*common.Empty)(nil), // 0: common.Empty
}
var file_alive_alive_proto_depIdxs = []int32{
	0, // 0: alive.Alive.Ping:input_type -> common.Empty
	0, // 1: alive.Alive.Ping:output_type -> common.Empty
	1, // [1:2] is the sub-list for method output_type
	0, // [0:1] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_alive_alive_proto_init() }
func file_alive_alive_proto_init() {
	if File_alive_alive_proto != nil {
		return
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_alive_alive_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   0,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_alive_alive_proto_goTypes,
		DependencyIndexes: file_alive_alive_proto_depIdxs,
	}.Build()
	File_alive_alive_proto = out.File
	file_alive_alive_proto_rawDesc = nil
	file_alive_alive_proto_goTypes = nil
	file_alive_alive_proto_depIdxs = nil
}