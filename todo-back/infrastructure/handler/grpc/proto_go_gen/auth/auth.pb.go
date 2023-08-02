// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v4.23.4
// source: auth/auth.proto

package auth

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	timestamppb "google.golang.org/protobuf/types/known/timestamppb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type SignupAuthStatus int32

const (
	SignupAuthStatus_SignupAuthStatusUnknown            SignupAuthStatus = 0
	SignupAuthStatus_SignupAuthStatusAllowed            SignupAuthStatus = 1
	SignupAuthStatus_SignupAuthStatusWaitForPermission  SignupAuthStatus = 2
	SignupAuthStatus_SignupAuthStatusAlreadyHaveAccount SignupAuthStatus = 3
)

// Enum value maps for SignupAuthStatus.
var (
	SignupAuthStatus_name = map[int32]string{
		0: "SignupAuthStatusUnknown",
		1: "SignupAuthStatusAllowed",
		2: "SignupAuthStatusWaitForPermission",
		3: "SignupAuthStatusAlreadyHaveAccount",
	}
	SignupAuthStatus_value = map[string]int32{
		"SignupAuthStatusUnknown":            0,
		"SignupAuthStatusAllowed":            1,
		"SignupAuthStatusWaitForPermission":  2,
		"SignupAuthStatusAlreadyHaveAccount": 3,
	}
)

func (x SignupAuthStatus) Enum() *SignupAuthStatus {
	p := new(SignupAuthStatus)
	*p = x
	return p
}

func (x SignupAuthStatus) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (SignupAuthStatus) Descriptor() protoreflect.EnumDescriptor {
	return file_auth_auth_proto_enumTypes[0].Descriptor()
}

func (SignupAuthStatus) Type() protoreflect.EnumType {
	return &file_auth_auth_proto_enumTypes[0]
}

func (x SignupAuthStatus) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use SignupAuthStatus.Descriptor instead.
func (SignupAuthStatus) EnumDescriptor() ([]byte, []int) {
	return file_auth_auth_proto_rawDescGZIP(), []int{0}
}

type SignUpInput struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Name     string `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	Email    string `protobuf:"bytes,2,opt,name=email,proto3" json:"email,omitempty"`
	Password string `protobuf:"bytes,3,opt,name=password,proto3" json:"password,omitempty"`
}

func (x *SignUpInput) Reset() {
	*x = SignUpInput{}
	if protoimpl.UnsafeEnabled {
		mi := &file_auth_auth_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SignUpInput) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SignUpInput) ProtoMessage() {}

func (x *SignUpInput) ProtoReflect() protoreflect.Message {
	mi := &file_auth_auth_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SignUpInput.ProtoReflect.Descriptor instead.
func (*SignUpInput) Descriptor() ([]byte, []int) {
	return file_auth_auth_proto_rawDescGZIP(), []int{0}
}

func (x *SignUpInput) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *SignUpInput) GetEmail() string {
	if x != nil {
		return x.Email
	}
	return ""
}

func (x *SignUpInput) GetPassword() string {
	if x != nil {
		return x.Password
	}
	return ""
}

type SignUpOutput struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Token  *Token           `protobuf:"bytes,1,opt,name=token,proto3,oneof" json:"token,omitempty"`
	Status SignupAuthStatus `protobuf:"varint,2,opt,name=status,proto3,enum=auth.SignupAuthStatus" json:"status,omitempty"`
}

func (x *SignUpOutput) Reset() {
	*x = SignUpOutput{}
	if protoimpl.UnsafeEnabled {
		mi := &file_auth_auth_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SignUpOutput) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SignUpOutput) ProtoMessage() {}

func (x *SignUpOutput) ProtoReflect() protoreflect.Message {
	mi := &file_auth_auth_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SignUpOutput.ProtoReflect.Descriptor instead.
func (*SignUpOutput) Descriptor() ([]byte, []int) {
	return file_auth_auth_proto_rawDescGZIP(), []int{1}
}

func (x *SignUpOutput) GetToken() *Token {
	if x != nil {
		return x.Token
	}
	return nil
}

func (x *SignUpOutput) GetStatus() SignupAuthStatus {
	if x != nil {
		return x.Status
	}
	return SignupAuthStatus_SignupAuthStatusUnknown
}

type SignInInput struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Email    string `protobuf:"bytes,1,opt,name=email,proto3" json:"email,omitempty"`
	Password string `protobuf:"bytes,2,opt,name=password,proto3" json:"password,omitempty"`
}

func (x *SignInInput) Reset() {
	*x = SignInInput{}
	if protoimpl.UnsafeEnabled {
		mi := &file_auth_auth_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SignInInput) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SignInInput) ProtoMessage() {}

func (x *SignInInput) ProtoReflect() protoreflect.Message {
	mi := &file_auth_auth_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SignInInput.ProtoReflect.Descriptor instead.
func (*SignInInput) Descriptor() ([]byte, []int) {
	return file_auth_auth_proto_rawDescGZIP(), []int{2}
}

func (x *SignInInput) GetEmail() string {
	if x != nil {
		return x.Email
	}
	return ""
}

func (x *SignInInput) GetPassword() string {
	if x != nil {
		return x.Password
	}
	return ""
}

type SignInOutput struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Token *Token `protobuf:"bytes,1,opt,name=token,proto3" json:"token,omitempty"`
}

func (x *SignInOutput) Reset() {
	*x = SignInOutput{}
	if protoimpl.UnsafeEnabled {
		mi := &file_auth_auth_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SignInOutput) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SignInOutput) ProtoMessage() {}

func (x *SignInOutput) ProtoReflect() protoreflect.Message {
	mi := &file_auth_auth_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SignInOutput.ProtoReflect.Descriptor instead.
func (*SignInOutput) Descriptor() ([]byte, []int) {
	return file_auth_auth_proto_rawDescGZIP(), []int{3}
}

func (x *SignInOutput) GetToken() *Token {
	if x != nil {
		return x.Token
	}
	return nil
}

type SignOutInput struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Token *Token `protobuf:"bytes,1,opt,name=token,proto3" json:"token,omitempty"`
}

func (x *SignOutInput) Reset() {
	*x = SignOutInput{}
	if protoimpl.UnsafeEnabled {
		mi := &file_auth_auth_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SignOutInput) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SignOutInput) ProtoMessage() {}

func (x *SignOutInput) ProtoReflect() protoreflect.Message {
	mi := &file_auth_auth_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SignOutInput.ProtoReflect.Descriptor instead.
func (*SignOutInput) Descriptor() ([]byte, []int) {
	return file_auth_auth_proto_rawDescGZIP(), []int{4}
}

func (x *SignOutInput) GetToken() *Token {
	if x != nil {
		return x.Token
	}
	return nil
}

type SignOutOutput struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *SignOutOutput) Reset() {
	*x = SignOutOutput{}
	if protoimpl.UnsafeEnabled {
		mi := &file_auth_auth_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SignOutOutput) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SignOutOutput) ProtoMessage() {}

func (x *SignOutOutput) ProtoReflect() protoreflect.Message {
	mi := &file_auth_auth_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SignOutOutput.ProtoReflect.Descriptor instead.
func (*SignOutOutput) Descriptor() ([]byte, []int) {
	return file_auth_auth_proto_rawDescGZIP(), []int{5}
}

type Token struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	AccessToken string                 `protobuf:"bytes,1,opt,name=access_token,json=accessToken,proto3" json:"access_token,omitempty"`
	ExpireTime  *timestamppb.Timestamp `protobuf:"bytes,2,opt,name=expire_time,json=expireTime,proto3,oneof" json:"expire_time,omitempty"`
}

func (x *Token) Reset() {
	*x = Token{}
	if protoimpl.UnsafeEnabled {
		mi := &file_auth_auth_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Token) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Token) ProtoMessage() {}

func (x *Token) ProtoReflect() protoreflect.Message {
	mi := &file_auth_auth_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Token.ProtoReflect.Descriptor instead.
func (*Token) Descriptor() ([]byte, []int) {
	return file_auth_auth_proto_rawDescGZIP(), []int{6}
}

func (x *Token) GetAccessToken() string {
	if x != nil {
		return x.AccessToken
	}
	return ""
}

func (x *Token) GetExpireTime() *timestamppb.Timestamp {
	if x != nil {
		return x.ExpireTime
	}
	return nil
}

var File_auth_auth_proto protoreflect.FileDescriptor

var file_auth_auth_proto_rawDesc = []byte{
	0x0a, 0x0f, 0x61, 0x75, 0x74, 0x68, 0x2f, 0x61, 0x75, 0x74, 0x68, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x12, 0x04, 0x61, 0x75, 0x74, 0x68, 0x1a, 0x1f, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2f,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61,
	0x6d, 0x70, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x53, 0x0a, 0x0b, 0x53, 0x69, 0x67, 0x6e,
	0x55, 0x70, 0x49, 0x6e, 0x70, 0x75, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x14, 0x0a, 0x05, 0x65,
	0x6d, 0x61, 0x69, 0x6c, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x65, 0x6d, 0x61, 0x69,
	0x6c, 0x12, 0x1a, 0x0a, 0x08, 0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x18, 0x03, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x08, 0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x22, 0x70, 0x0a,
	0x0c, 0x53, 0x69, 0x67, 0x6e, 0x55, 0x70, 0x4f, 0x75, 0x74, 0x70, 0x75, 0x74, 0x12, 0x26, 0x0a,
	0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0b, 0x2e, 0x61,
	0x75, 0x74, 0x68, 0x2e, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x48, 0x00, 0x52, 0x05, 0x74, 0x6f, 0x6b,
	0x65, 0x6e, 0x88, 0x01, 0x01, 0x12, 0x2e, 0x0a, 0x06, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x18,
	0x02, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x16, 0x2e, 0x61, 0x75, 0x74, 0x68, 0x2e, 0x53, 0x69, 0x67,
	0x6e, 0x75, 0x70, 0x41, 0x75, 0x74, 0x68, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x52, 0x06, 0x73,
	0x74, 0x61, 0x74, 0x75, 0x73, 0x42, 0x08, 0x0a, 0x06, 0x5f, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x22,
	0x3f, 0x0a, 0x0b, 0x53, 0x69, 0x67, 0x6e, 0x49, 0x6e, 0x49, 0x6e, 0x70, 0x75, 0x74, 0x12, 0x14,
	0x0a, 0x05, 0x65, 0x6d, 0x61, 0x69, 0x6c, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x65,
	0x6d, 0x61, 0x69, 0x6c, 0x12, 0x1a, 0x0a, 0x08, 0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x08, 0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64,
	0x22, 0x31, 0x0a, 0x0c, 0x53, 0x69, 0x67, 0x6e, 0x49, 0x6e, 0x4f, 0x75, 0x74, 0x70, 0x75, 0x74,
	0x12, 0x21, 0x0a, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0b, 0x32,
	0x0b, 0x2e, 0x61, 0x75, 0x74, 0x68, 0x2e, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x52, 0x05, 0x74, 0x6f,
	0x6b, 0x65, 0x6e, 0x22, 0x31, 0x0a, 0x0c, 0x53, 0x69, 0x67, 0x6e, 0x4f, 0x75, 0x74, 0x49, 0x6e,
	0x70, 0x75, 0x74, 0x12, 0x21, 0x0a, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x0b, 0x32, 0x0b, 0x2e, 0x61, 0x75, 0x74, 0x68, 0x2e, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x52,
	0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x22, 0x0f, 0x0a, 0x0d, 0x53, 0x69, 0x67, 0x6e, 0x4f, 0x75,
	0x74, 0x4f, 0x75, 0x74, 0x70, 0x75, 0x74, 0x22, 0x7c, 0x0a, 0x05, 0x54, 0x6f, 0x6b, 0x65, 0x6e,
	0x12, 0x21, 0x0a, 0x0c, 0x61, 0x63, 0x63, 0x65, 0x73, 0x73, 0x5f, 0x74, 0x6f, 0x6b, 0x65, 0x6e,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x61, 0x63, 0x63, 0x65, 0x73, 0x73, 0x54, 0x6f,
	0x6b, 0x65, 0x6e, 0x12, 0x40, 0x0a, 0x0b, 0x65, 0x78, 0x70, 0x69, 0x72, 0x65, 0x5f, 0x74, 0x69,
	0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c,
	0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x54, 0x69, 0x6d, 0x65, 0x73,
	0x74, 0x61, 0x6d, 0x70, 0x48, 0x00, 0x52, 0x0a, 0x65, 0x78, 0x70, 0x69, 0x72, 0x65, 0x54, 0x69,
	0x6d, 0x65, 0x88, 0x01, 0x01, 0x42, 0x0e, 0x0a, 0x0c, 0x5f, 0x65, 0x78, 0x70, 0x69, 0x72, 0x65,
	0x5f, 0x74, 0x69, 0x6d, 0x65, 0x2a, 0x9b, 0x01, 0x0a, 0x10, 0x53, 0x69, 0x67, 0x6e, 0x75, 0x70,
	0x41, 0x75, 0x74, 0x68, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x12, 0x1b, 0x0a, 0x17, 0x53, 0x69,
	0x67, 0x6e, 0x75, 0x70, 0x41, 0x75, 0x74, 0x68, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x55, 0x6e,
	0x6b, 0x6e, 0x6f, 0x77, 0x6e, 0x10, 0x00, 0x12, 0x1b, 0x0a, 0x17, 0x53, 0x69, 0x67, 0x6e, 0x75,
	0x70, 0x41, 0x75, 0x74, 0x68, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x41, 0x6c, 0x6c, 0x6f, 0x77,
	0x65, 0x64, 0x10, 0x01, 0x12, 0x25, 0x0a, 0x21, 0x53, 0x69, 0x67, 0x6e, 0x75, 0x70, 0x41, 0x75,
	0x74, 0x68, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x57, 0x61, 0x69, 0x74, 0x46, 0x6f, 0x72, 0x50,
	0x65, 0x72, 0x6d, 0x69, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x10, 0x02, 0x12, 0x26, 0x0a, 0x22, 0x53,
	0x69, 0x67, 0x6e, 0x75, 0x70, 0x41, 0x75, 0x74, 0x68, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x41,
	0x6c, 0x72, 0x65, 0x61, 0x64, 0x79, 0x48, 0x61, 0x76, 0x65, 0x41, 0x63, 0x63, 0x6f, 0x75, 0x6e,
	0x74, 0x10, 0x03, 0x32, 0xa2, 0x01, 0x0a, 0x04, 0x41, 0x75, 0x74, 0x68, 0x12, 0x31, 0x0a, 0x06,
	0x53, 0x69, 0x67, 0x6e, 0x55, 0x70, 0x12, 0x11, 0x2e, 0x61, 0x75, 0x74, 0x68, 0x2e, 0x53, 0x69,
	0x67, 0x6e, 0x55, 0x70, 0x49, 0x6e, 0x70, 0x75, 0x74, 0x1a, 0x12, 0x2e, 0x61, 0x75, 0x74, 0x68,
	0x2e, 0x53, 0x69, 0x67, 0x6e, 0x55, 0x70, 0x4f, 0x75, 0x74, 0x70, 0x75, 0x74, 0x22, 0x00, 0x12,
	0x31, 0x0a, 0x06, 0x53, 0x69, 0x67, 0x6e, 0x49, 0x6e, 0x12, 0x11, 0x2e, 0x61, 0x75, 0x74, 0x68,
	0x2e, 0x53, 0x69, 0x67, 0x6e, 0x49, 0x6e, 0x49, 0x6e, 0x70, 0x75, 0x74, 0x1a, 0x12, 0x2e, 0x61,
	0x75, 0x74, 0x68, 0x2e, 0x53, 0x69, 0x67, 0x6e, 0x49, 0x6e, 0x4f, 0x75, 0x74, 0x70, 0x75, 0x74,
	0x22, 0x00, 0x12, 0x34, 0x0a, 0x07, 0x53, 0x69, 0x67, 0x6e, 0x4f, 0x75, 0x74, 0x12, 0x12, 0x2e,
	0x61, 0x75, 0x74, 0x68, 0x2e, 0x53, 0x69, 0x67, 0x6e, 0x4f, 0x75, 0x74, 0x49, 0x6e, 0x70, 0x75,
	0x74, 0x1a, 0x13, 0x2e, 0x61, 0x75, 0x74, 0x68, 0x2e, 0x53, 0x69, 0x67, 0x6e, 0x4f, 0x75, 0x74,
	0x4f, 0x75, 0x74, 0x70, 0x75, 0x74, 0x22, 0x00, 0x42, 0x39, 0x5a, 0x37, 0x74, 0x6f, 0x64, 0x6f,
	0x2d, 0x62, 0x61, 0x63, 0x6b, 0x2f, 0x69, 0x6e, 0x66, 0x72, 0x61, 0x73, 0x74, 0x72, 0x75, 0x63,
	0x74, 0x75, 0x72, 0x65, 0x2f, 0x68, 0x61, 0x6e, 0x64, 0x6c, 0x65, 0x72, 0x2f, 0x67, 0x72, 0x70,
	0x63, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x5f, 0x67, 0x6f, 0x5f, 0x67, 0x65, 0x6e, 0x2f, 0x61,
	0x75, 0x74, 0x68, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_auth_auth_proto_rawDescOnce sync.Once
	file_auth_auth_proto_rawDescData = file_auth_auth_proto_rawDesc
)

func file_auth_auth_proto_rawDescGZIP() []byte {
	file_auth_auth_proto_rawDescOnce.Do(func() {
		file_auth_auth_proto_rawDescData = protoimpl.X.CompressGZIP(file_auth_auth_proto_rawDescData)
	})
	return file_auth_auth_proto_rawDescData
}

var file_auth_auth_proto_enumTypes = make([]protoimpl.EnumInfo, 1)
var file_auth_auth_proto_msgTypes = make([]protoimpl.MessageInfo, 7)
var file_auth_auth_proto_goTypes = []interface{}{
	(SignupAuthStatus)(0),         // 0: auth.SignupAuthStatus
	(*SignUpInput)(nil),           // 1: auth.SignUpInput
	(*SignUpOutput)(nil),          // 2: auth.SignUpOutput
	(*SignInInput)(nil),           // 3: auth.SignInInput
	(*SignInOutput)(nil),          // 4: auth.SignInOutput
	(*SignOutInput)(nil),          // 5: auth.SignOutInput
	(*SignOutOutput)(nil),         // 6: auth.SignOutOutput
	(*Token)(nil),                 // 7: auth.Token
	(*timestamppb.Timestamp)(nil), // 8: google.protobuf.Timestamp
}
var file_auth_auth_proto_depIdxs = []int32{
	7, // 0: auth.SignUpOutput.token:type_name -> auth.Token
	0, // 1: auth.SignUpOutput.status:type_name -> auth.SignupAuthStatus
	7, // 2: auth.SignInOutput.token:type_name -> auth.Token
	7, // 3: auth.SignOutInput.token:type_name -> auth.Token
	8, // 4: auth.Token.expire_time:type_name -> google.protobuf.Timestamp
	1, // 5: auth.Auth.SignUp:input_type -> auth.SignUpInput
	3, // 6: auth.Auth.SignIn:input_type -> auth.SignInInput
	5, // 7: auth.Auth.SignOut:input_type -> auth.SignOutInput
	2, // 8: auth.Auth.SignUp:output_type -> auth.SignUpOutput
	4, // 9: auth.Auth.SignIn:output_type -> auth.SignInOutput
	6, // 10: auth.Auth.SignOut:output_type -> auth.SignOutOutput
	8, // [8:11] is the sub-list for method output_type
	5, // [5:8] is the sub-list for method input_type
	5, // [5:5] is the sub-list for extension type_name
	5, // [5:5] is the sub-list for extension extendee
	0, // [0:5] is the sub-list for field type_name
}

func init() { file_auth_auth_proto_init() }
func file_auth_auth_proto_init() {
	if File_auth_auth_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_auth_auth_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SignUpInput); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_auth_auth_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SignUpOutput); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_auth_auth_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SignInInput); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_auth_auth_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SignInOutput); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_auth_auth_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SignOutInput); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_auth_auth_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SignOutOutput); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_auth_auth_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Token); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	file_auth_auth_proto_msgTypes[1].OneofWrappers = []interface{}{}
	file_auth_auth_proto_msgTypes[6].OneofWrappers = []interface{}{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_auth_auth_proto_rawDesc,
			NumEnums:      1,
			NumMessages:   7,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_auth_auth_proto_goTypes,
		DependencyIndexes: file_auth_auth_proto_depIdxs,
		EnumInfos:         file_auth_auth_proto_enumTypes,
		MessageInfos:      file_auth_auth_proto_msgTypes,
	}.Build()
	File_auth_auth_proto = out.File
	file_auth_auth_proto_rawDesc = nil
	file_auth_auth_proto_goTypes = nil
	file_auth_auth_proto_depIdxs = nil
}