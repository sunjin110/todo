//
//  Generated code. Do not modify.
//  source: todo/todo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use statusDescriptor instead')
const Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'done', '2': 0},
    {'1': 'scheduled', '2': 1},
    {'1': 'draft', '2': 2},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode(
    'CgZTdGF0dXMSCAoEZG9uZRAAEg0KCXNjaGVkdWxlZBABEgkKBWRyYWZ0EAI=');

@$core.Deprecated('Use todoFilterDescriptor instead')
const TodoFilter$json = {
  '1': 'TodoFilter',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 11, '6': '.todo.TodoId', '9': 0, '10': 'id', '17': true},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'title', '17': true},
    {'1': 'title_filter_kind', '3': 3, '4': 1, '5': 14, '6': '.list.FilterKind', '9': 2, '10': 'titleFilterKind', '17': true},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'description', '17': true},
    {'1': 'description_filter_kind', '3': 5, '4': 1, '5': 14, '6': '.list.FilterKind', '9': 4, '10': 'descriptionFilterKind', '17': true},
    {'1': 'status', '3': 6, '4': 1, '5': 14, '6': '.todo.Status', '9': 5, '10': 'status', '17': true},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_title'},
    {'1': '_title_filter_kind'},
    {'1': '_description'},
    {'1': '_description_filter_kind'},
    {'1': '_status'},
  ],
};

/// Descriptor for `TodoFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoFilterDescriptor = $convert.base64Decode(
    'CgpUb2RvRmlsdGVyEiEKAmlkGAEgASgLMgwudG9kby5Ub2RvSWRIAFICaWSIAQESGQoFdGl0bG'
    'UYAiABKAlIAVIFdGl0bGWIAQESQQoRdGl0bGVfZmlsdGVyX2tpbmQYAyABKA4yEC5saXN0LkZp'
    'bHRlcktpbmRIAlIPdGl0bGVGaWx0ZXJLaW5kiAEBEiUKC2Rlc2NyaXB0aW9uGAQgASgJSANSC2'
    'Rlc2NyaXB0aW9uiAEBEk0KF2Rlc2NyaXB0aW9uX2ZpbHRlcl9raW5kGAUgASgOMhAubGlzdC5G'
    'aWx0ZXJLaW5kSARSFWRlc2NyaXB0aW9uRmlsdGVyS2luZIgBARIpCgZzdGF0dXMYBiABKA4yDC'
    '50b2RvLlN0YXR1c0gFUgZzdGF0dXOIAQFCBQoDX2lkQggKBl90aXRsZUIUChJfdGl0bGVfZmls'
    'dGVyX2tpbmRCDgoMX2Rlc2NyaXB0aW9uQhoKGF9kZXNjcmlwdGlvbl9maWx0ZXJfa2luZEIJCg'
    'dfc3RhdHVz');

@$core.Deprecated('Use todoSortDescriptor instead')
const TodoSort$json = {
  '1': 'TodoSort',
  '2': [
    {'1': 'create_time', '3': 1, '4': 1, '5': 11, '6': '.list.SortField', '9': 0, '10': 'createTime', '17': true},
    {'1': 'done_time', '3': 2, '4': 1, '5': 11, '6': '.list.SortField', '9': 1, '10': 'doneTime', '17': true},
  ],
  '8': [
    {'1': '_create_time'},
    {'1': '_done_time'},
  ],
};

/// Descriptor for `TodoSort`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoSortDescriptor = $convert.base64Decode(
    'CghUb2RvU29ydBI1CgtjcmVhdGVfdGltZRgBIAEoCzIPLmxpc3QuU29ydEZpZWxkSABSCmNyZW'
    'F0ZVRpbWWIAQESMQoJZG9uZV90aW1lGAIgASgLMg8ubGlzdC5Tb3J0RmllbGRIAVIIZG9uZVRp'
    'bWWIAQFCDgoMX2NyZWF0ZV90aW1lQgwKCl9kb25lX3RpbWU=');

@$core.Deprecated('Use listInputDescriptor instead')
const ListInput$json = {
  '1': 'ListInput',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 11, '6': '.authentication.Session', '10': 'session'},
    {'1': 'paging', '3': 2, '4': 1, '5': 11, '6': '.list.Paging', '10': 'paging'},
    {'1': 'filter', '3': 3, '4': 1, '5': 11, '6': '.todo.TodoFilter', '9': 0, '10': 'filter', '17': true},
    {'1': 'sort', '3': 4, '4': 1, '5': 11, '6': '.todo.TodoSort', '9': 1, '10': 'sort', '17': true},
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
    'AyABKAsyEC50b2RvLlRvZG9GaWx0ZXJIAFIGZmlsdGVyiAEBEicKBHNvcnQYBCABKAsyDi50b2'
    'RvLlRvZG9Tb3J0SAFSBHNvcnSIAQFCCQoHX2ZpbHRlckIHCgVfc29ydA==');

@$core.Deprecated('Use listOutputDescriptor instead')
const ListOutput$json = {
  '1': 'ListOutput',
  '2': [
    {'1': 'has_next', '3': 1, '4': 1, '5': 8, '10': 'hasNext'},
    {'1': 'todos', '3': 2, '4': 3, '5': 11, '6': '.todo.Todo', '10': 'todos'},
  ],
};

/// Descriptor for `ListOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOutputDescriptor = $convert.base64Decode(
    'CgpMaXN0T3V0cHV0EhkKCGhhc19uZXh0GAEgASgIUgdoYXNOZXh0EiAKBXRvZG9zGAIgAygLMg'
    'oudG9kby5Ub2RvUgV0b2Rvcw==');

@$core.Deprecated('Use getInputDescriptor instead')
const GetInput$json = {
  '1': 'GetInput',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 11, '6': '.authentication.Session', '10': 'session'},
    {'1': 'id', '3': 2, '4': 1, '5': 11, '6': '.todo.TodoId', '10': 'id'},
  ],
};

/// Descriptor for `GetInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInputDescriptor = $convert.base64Decode(
    'CghHZXRJbnB1dBIxCgdzZXNzaW9uGAEgASgLMhcuYXV0aGVudGljYXRpb24uU2Vzc2lvblIHc2'
    'Vzc2lvbhIcCgJpZBgCIAEoCzIMLnRvZG8uVG9kb0lkUgJpZA==');

@$core.Deprecated('Use getOutputDescriptor instead')
const GetOutput$json = {
  '1': 'GetOutput',
  '2': [
    {'1': 'todo', '3': 1, '4': 1, '5': 11, '6': '.todo.Todo', '10': 'todo'},
  ],
};

/// Descriptor for `GetOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOutputDescriptor = $convert.base64Decode(
    'CglHZXRPdXRwdXQSHgoEdG9kbxgBIAEoCzIKLnRvZG8uVG9kb1IEdG9kbw==');

@$core.Deprecated('Use createInputDescriptor instead')
const CreateInput$json = {
  '1': 'CreateInput',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 11, '6': '.authentication.Session', '10': 'session'},
    {'1': 'todo', '3': 2, '4': 1, '5': 11, '6': '.todo.CreateTodo', '10': 'todo'},
  ],
};

/// Descriptor for `CreateInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInputDescriptor = $convert.base64Decode(
    'CgtDcmVhdGVJbnB1dBIxCgdzZXNzaW9uGAEgASgLMhcuYXV0aGVudGljYXRpb24uU2Vzc2lvbl'
    'IHc2Vzc2lvbhIkCgR0b2RvGAIgASgLMhAudG9kby5DcmVhdGVUb2RvUgR0b2Rv');

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
    {'1': 'todo', '3': 2, '4': 1, '5': 11, '6': '.todo.UpdateTodo', '10': 'todo'},
  ],
};

/// Descriptor for `UpdateInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInputDescriptor = $convert.base64Decode(
    'CgtVcGRhdGVJbnB1dBIxCgdzZXNzaW9uGAEgASgLMhcuYXV0aGVudGljYXRpb24uU2Vzc2lvbl'
    'IHc2Vzc2lvbhIkCgR0b2RvGAIgASgLMhAudG9kby5VcGRhdGVUb2RvUgR0b2Rv');

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
    {'1': 'id', '3': 2, '4': 1, '5': 11, '6': '.todo.TodoId', '10': 'id'},
  ],
};

/// Descriptor for `DeleteInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteInputDescriptor = $convert.base64Decode(
    'CgtEZWxldGVJbnB1dBIxCgdzZXNzaW9uGAEgASgLMhcuYXV0aGVudGljYXRpb24uU2Vzc2lvbl'
    'IHc2Vzc2lvbhIcCgJpZBgCIAEoCzIMLnRvZG8uVG9kb0lkUgJpZA==');

@$core.Deprecated('Use deleteOutputDescriptor instead')
const DeleteOutput$json = {
  '1': 'DeleteOutput',
};

/// Descriptor for `DeleteOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOutputDescriptor = $convert.base64Decode(
    'CgxEZWxldGVPdXRwdXQ=');

@$core.Deprecated('Use todoIdDescriptor instead')
const TodoId$json = {
  '1': 'TodoId',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `TodoId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoIdDescriptor = $convert.base64Decode(
    'CgZUb2RvSWQSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use createTodoDescriptor instead')
const CreateTodo$json = {
  '1': 'CreateTodo',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'status', '3': 3, '4': 1, '5': 14, '6': '.todo.Status', '10': 'status'},
  ],
};

/// Descriptor for `CreateTodo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTodoDescriptor = $convert.base64Decode(
    'CgpDcmVhdGVUb2RvEhQKBXRpdGxlGAEgASgJUgV0aXRsZRIgCgtkZXNjcmlwdGlvbhgCIAEoCV'
    'ILZGVzY3JpcHRpb24SJAoGc3RhdHVzGAMgASgOMgwudG9kby5TdGF0dXNSBnN0YXR1cw==');

@$core.Deprecated('Use updateTodoDescriptor instead')
const UpdateTodo$json = {
  '1': 'UpdateTodo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 11, '6': '.todo.TodoId', '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.todo.Status', '9': 2, '10': 'status', '17': true},
  ],
  '8': [
    {'1': '_title'},
    {'1': '_description'},
    {'1': '_status'},
  ],
};

/// Descriptor for `UpdateTodo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTodoDescriptor = $convert.base64Decode(
    'CgpVcGRhdGVUb2RvEhwKAmlkGAEgASgLMgwudG9kby5Ub2RvSWRSAmlkEhkKBXRpdGxlGAIgAS'
    'gJSABSBXRpdGxliAEBEiUKC2Rlc2NyaXB0aW9uGAMgASgJSAFSC2Rlc2NyaXB0aW9uiAEBEikK'
    'BnN0YXR1cxgEIAEoDjIMLnRvZG8uU3RhdHVzSAJSBnN0YXR1c4gBAUIICgZfdGl0bGVCDgoMX2'
    'Rlc2NyaXB0aW9uQgkKB19zdGF0dXM=');

@$core.Deprecated('Use todoDescriptor instead')
const Todo$json = {
  '1': 'Todo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 11, '6': '.todo.TodoId', '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.todo.Status', '10': 'status'},
    {'1': 'user_id', '3': 5, '4': 1, '5': 11, '6': '.user.UserId', '10': 'userId'},
    {'1': 'create_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createTime'},
    {'1': 'done_time', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'doneTime', '17': true},
  ],
  '8': [
    {'1': '_done_time'},
  ],
};

/// Descriptor for `Todo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoDescriptor = $convert.base64Decode(
    'CgRUb2RvEhwKAmlkGAEgASgLMgwudG9kby5Ub2RvSWRSAmlkEhQKBXRpdGxlGAIgASgJUgV0aX'
    'RsZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SJAoGc3RhdHVzGAQgASgOMgwu'
    'dG9kby5TdGF0dXNSBnN0YXR1cxIlCgd1c2VyX2lkGAUgASgLMgwudXNlci5Vc2VySWRSBnVzZX'
    'JJZBI7CgtjcmVhdGVfdGltZRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCmNy'
    'ZWF0ZVRpbWUSPAoJZG9uZV90aW1lGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcE'
    'gAUghkb25lVGltZYgBAUIMCgpfZG9uZV90aW1l');

