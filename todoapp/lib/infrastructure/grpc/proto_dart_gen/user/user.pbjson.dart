//
//  Generated code. Do not modify.
//  source: user/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userIdDescriptor instead')
const UserId$json = {
  '1': 'UserId',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `UserId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userIdDescriptor = $convert.base64Decode(
    'CgZVc2VySWQSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 11, '6': '.user.UserId', '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.authentication.UserSignUpStatus', '10': 'status'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhwKAmlkGAEgASgLMgwudXNlci5Vc2VySWRSAmlkEhIKBG5hbWUYAiABKAlSBG5hbW'
    'USFAoFZW1haWwYAyABKAlSBWVtYWlsEjgKBnN0YXR1cxgEIAEoDjIgLmF1dGhlbnRpY2F0aW9u'
    'LlVzZXJTaWduVXBTdGF0dXNSBnN0YXR1cw==');

@$core.Deprecated('Use createUserDescriptor instead')
const CreateUser$json = {
  '1': 'CreateUser',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'password', '17': true},
    {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.authentication.UserSignUpStatus', '10': 'status'},
  ],
  '8': [
    {'1': '_password'},
  ],
};

/// Descriptor for `CreateUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserDescriptor = $convert.base64Decode(
    'CgpDcmVhdGVVc2VyEhIKBG5hbWUYASABKAlSBG5hbWUSFAoFZW1haWwYAiABKAlSBWVtYWlsEh'
    '8KCHBhc3N3b3JkGAMgASgJSABSCHBhc3N3b3JkiAEBEjgKBnN0YXR1cxgEIAEoDjIgLmF1dGhl'
    'bnRpY2F0aW9uLlVzZXJTaWduVXBTdGF0dXNSBnN0YXR1c0ILCglfcGFzc3dvcmQ=');

@$core.Deprecated('Use updateUserDescriptor instead')
const UpdateUser$json = {
  '1': 'UpdateUser',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 11, '6': '.user.UserId', '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'email', '17': true},
    {'1': 'password', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'password', '17': true},
    {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.authentication.UserSignUpStatus', '9': 3, '10': 'status', '17': true},
  ],
  '8': [
    {'1': '_name'},
    {'1': '_email'},
    {'1': '_password'},
    {'1': '_status'},
  ],
};

/// Descriptor for `UpdateUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserDescriptor = $convert.base64Decode(
    'CgpVcGRhdGVVc2VyEhwKAmlkGAEgASgLMgwudXNlci5Vc2VySWRSAmlkEhcKBG5hbWUYAiABKA'
    'lIAFIEbmFtZYgBARIZCgVlbWFpbBgDIAEoCUgBUgVlbWFpbIgBARIfCghwYXNzd29yZBgEIAEo'
    'CUgCUghwYXNzd29yZIgBARI9CgZzdGF0dXMYBSABKA4yIC5hdXRoZW50aWNhdGlvbi5Vc2VyU2'
    'lnblVwU3RhdHVzSANSBnN0YXR1c4gBAUIHCgVfbmFtZUIICgZfZW1haWxCCwoJX3Bhc3N3b3Jk'
    'QgkKB19zdGF0dXM=');

@$core.Deprecated('Use createInputDescriptor instead')
const CreateInput$json = {
  '1': 'CreateInput',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 11, '6': '.authentication.Session', '10': 'session'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.user.CreateUser', '10': 'user'},
  ],
};

/// Descriptor for `CreateInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInputDescriptor = $convert.base64Decode(
    'CgtDcmVhdGVJbnB1dBIxCgdzZXNzaW9uGAEgASgLMhcuYXV0aGVudGljYXRpb24uU2Vzc2lvbl'
    'IHc2Vzc2lvbhIkCgR1c2VyGAIgASgLMhAudXNlci5DcmVhdGVVc2VyUgR1c2Vy');

@$core.Deprecated('Use createOutputDescriptor instead')
const CreateOutput$json = {
  '1': 'CreateOutput',
};

/// Descriptor for `CreateOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOutputDescriptor = $convert.base64Decode(
    'CgxDcmVhdGVPdXRwdXQ=');

@$core.Deprecated('Use updateInputDescriptor instead')
const UpdateInput$json = {
  '1': 'UpdateInput',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 11, '6': '.authentication.Session', '10': 'session'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.user.UpdateUser', '10': 'user'},
  ],
};

/// Descriptor for `UpdateInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInputDescriptor = $convert.base64Decode(
    'CgtVcGRhdGVJbnB1dBIxCgdzZXNzaW9uGAEgASgLMhcuYXV0aGVudGljYXRpb24uU2Vzc2lvbl'
    'IHc2Vzc2lvbhIkCgR1c2VyGAIgASgLMhAudXNlci5VcGRhdGVVc2VyUgR1c2Vy');

@$core.Deprecated('Use updateOutputDescriptor instead')
const UpdateOutput$json = {
  '1': 'UpdateOutput',
};

/// Descriptor for `UpdateOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOutputDescriptor = $convert.base64Decode(
    'CgxVcGRhdGVPdXRwdXQ=');

@$core.Deprecated('Use deleteInputDescriptor instead')
const DeleteInput$json = {
  '1': 'DeleteInput',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 11, '6': '.authentication.Session', '10': 'session'},
    {'1': 'id', '3': 2, '4': 1, '5': 11, '6': '.user.UserId', '10': 'id'},
  ],
};

/// Descriptor for `DeleteInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteInputDescriptor = $convert.base64Decode(
    'CgtEZWxldGVJbnB1dBIxCgdzZXNzaW9uGAEgASgLMhcuYXV0aGVudGljYXRpb24uU2Vzc2lvbl'
    'IHc2Vzc2lvbhIcCgJpZBgCIAEoCzIMLnVzZXIuVXNlcklkUgJpZA==');

@$core.Deprecated('Use deleteOutputDescriptor instead')
const DeleteOutput$json = {
  '1': 'DeleteOutput',
};

/// Descriptor for `DeleteOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOutputDescriptor = $convert.base64Decode(
    'CgxEZWxldGVPdXRwdXQ=');

@$core.Deprecated('Use userFilterDescriptor instead')
const UserFilter$json = {
  '1': 'UserFilter',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 11, '6': '.user.UserId', '9': 0, '10': 'id', '17': true},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'name', '17': true},
    {'1': 'name_filter_kind', '3': 3, '4': 1, '5': 14, '6': '.list.FilterKind', '9': 2, '10': 'nameFilterKind', '17': true},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'email', '17': true},
    {'1': 'email_filter_kind', '3': 5, '4': 1, '5': 14, '6': '.list.FilterKind', '9': 4, '10': 'emailFilterKind', '17': true},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_name'},
    {'1': '_name_filter_kind'},
    {'1': '_email'},
    {'1': '_email_filter_kind'},
  ],
};

/// Descriptor for `UserFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userFilterDescriptor = $convert.base64Decode(
    'CgpVc2VyRmlsdGVyEiEKAmlkGAEgASgLMgwudXNlci5Vc2VySWRIAFICaWSIAQESFwoEbmFtZR'
    'gCIAEoCUgBUgRuYW1liAEBEj8KEG5hbWVfZmlsdGVyX2tpbmQYAyABKA4yEC5saXN0LkZpbHRl'
    'cktpbmRIAlIObmFtZUZpbHRlcktpbmSIAQESGQoFZW1haWwYBCABKAlIA1IFZW1haWyIAQESQQ'
    'oRZW1haWxfZmlsdGVyX2tpbmQYBSABKA4yEC5saXN0LkZpbHRlcktpbmRIBFIPZW1haWxGaWx0'
    'ZXJLaW5kiAEBQgUKA19pZEIHCgVfbmFtZUITChFfbmFtZV9maWx0ZXJfa2luZEIICgZfZW1haW'
    'xCFAoSX2VtYWlsX2ZpbHRlcl9raW5k');

@$core.Deprecated('Use userSortDescriptor instead')
const UserSort$json = {
  '1': 'UserSort',
  '2': [
    {'1': 'last_login', '3': 1, '4': 1, '5': 11, '6': '.list.SortField', '9': 0, '10': 'lastLogin', '17': true},
    {'1': 'create_time', '3': 2, '4': 1, '5': 11, '6': '.list.SortField', '9': 1, '10': 'createTime', '17': true},
  ],
  '8': [
    {'1': '_last_login'},
    {'1': '_create_time'},
  ],
};

/// Descriptor for `UserSort`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSortDescriptor = $convert.base64Decode(
    'CghVc2VyU29ydBIzCgpsYXN0X2xvZ2luGAEgASgLMg8ubGlzdC5Tb3J0RmllbGRIAFIJbGFzdE'
    'xvZ2luiAEBEjUKC2NyZWF0ZV90aW1lGAIgASgLMg8ubGlzdC5Tb3J0RmllbGRIAVIKY3JlYXRl'
    'VGltZYgBAUINCgtfbGFzdF9sb2dpbkIOCgxfY3JlYXRlX3RpbWU=');

@$core.Deprecated('Use listInputDescriptor instead')
const ListInput$json = {
  '1': 'ListInput',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 11, '6': '.authentication.Session', '10': 'session'},
    {'1': 'paging', '3': 2, '4': 1, '5': 11, '6': '.list.Paging', '10': 'paging'},
    {'1': 'filter', '3': 3, '4': 1, '5': 11, '6': '.user.UserFilter', '9': 0, '10': 'filter', '17': true},
    {'1': 'sort', '3': 4, '4': 1, '5': 11, '6': '.user.UserSort', '9': 1, '10': 'sort', '17': true},
  ],
  '8': [
    {'1': '_filter'},
    {'1': '_sort'},
  ],
};

/// Descriptor for `ListInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInputDescriptor = $convert.base64Decode(
    'CglMaXN0SW5wdXQSMQoHc2Vzc2lvbhgBIAEoCzIXLmF1dGhlbnRpY2F0aW9uLlNlc3Npb25SB3'
    'Nlc3Npb24SJAoGcGFnaW5nGAIgASgLMgwubGlzdC5QYWdpbmdSBnBhZ2luZxItCgZmaWx0ZXIY'
    'AyABKAsyEC51c2VyLlVzZXJGaWx0ZXJIAFIGZmlsdGVyiAEBEicKBHNvcnQYBCABKAsyDi51c2'
    'VyLlVzZXJTb3J0SAFSBHNvcnSIAQFCCQoHX2ZpbHRlckIHCgVfc29ydA==');

@$core.Deprecated('Use listOutputDescriptor instead')
const ListOutput$json = {
  '1': 'ListOutput',
  '2': [
    {'1': 'has_next', '3': 1, '4': 1, '5': 8, '10': 'hasNext'},
    {'1': 'users', '3': 2, '4': 3, '5': 11, '6': '.user.User', '10': 'users'},
  ],
};

/// Descriptor for `ListOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOutputDescriptor = $convert.base64Decode(
    'CgpMaXN0T3V0cHV0EhkKCGhhc19uZXh0GAEgASgIUgdoYXNOZXh0EiAKBXVzZXJzGAIgAygLMg'
    'oudXNlci5Vc2VyUgV1c2Vycw==');

@$core.Deprecated('Use getInputDescriptor instead')
const GetInput$json = {
  '1': 'GetInput',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 11, '6': '.authentication.Session', '10': 'session'},
    {'1': 'id', '3': 2, '4': 1, '5': 11, '6': '.user.UserId', '10': 'id'},
  ],
};

/// Descriptor for `GetInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInputDescriptor = $convert.base64Decode(
    'CghHZXRJbnB1dBIxCgdzZXNzaW9uGAEgASgLMhcuYXV0aGVudGljYXRpb24uU2Vzc2lvblIHc2'
    'Vzc2lvbhIcCgJpZBgCIAEoCzIMLnVzZXIuVXNlcklkUgJpZA==');

@$core.Deprecated('Use getOutputDescriptor instead')
const GetOutput$json = {
  '1': 'GetOutput',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.user.User', '10': 'user'},
  ],
};

/// Descriptor for `GetOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOutputDescriptor = $convert.base64Decode(
    'CglHZXRPdXRwdXQSHgoEdXNlchgBIAEoCzIKLnVzZXIuVXNlclIEdXNlcg==');

