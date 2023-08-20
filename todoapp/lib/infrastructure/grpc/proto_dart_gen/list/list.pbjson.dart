//
//  Generated code. Do not modify.
//  source: list/list.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use filterKindDescriptor instead')
const FilterKind$json = {
  '1': 'FilterKind',
  '2': [
    {'1': 'FilterUnknown', '2': 0},
    {'1': 'FilterPartialMatch', '2': 1},
    {'1': 'FilterPerfectMatch', '2': 2},
  ],
};

/// Descriptor for `FilterKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List filterKindDescriptor = $convert.base64Decode(
    'CgpGaWx0ZXJLaW5kEhEKDUZpbHRlclVua25vd24QABIWChJGaWx0ZXJQYXJ0aWFsTWF0Y2gQAR'
    'IWChJGaWx0ZXJQZXJmZWN0TWF0Y2gQAg==');

@$core.Deprecated('Use sortKindDescriptor instead')
const SortKind$json = {
  '1': 'SortKind',
  '2': [
    {'1': 'FilterAsc', '2': 0},
    {'1': 'FilterDesc', '2': 1},
  ],
};

/// Descriptor for `SortKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sortKindDescriptor = $convert
    .base64Decode('CghTb3J0S2luZBINCglGaWx0ZXJBc2MQABIOCgpGaWx0ZXJEZXNjEAE=');

@$core.Deprecated('Use pagingDescriptor instead')
const Paging$json = {
  '1': 'Paging',
  '2': [
    {'1': 'offset', '3': 1, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `Paging`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pagingDescriptor = $convert.base64Decode(
    'CgZQYWdpbmcSFgoGb2Zmc2V0GAEgASgFUgZvZmZzZXQSFAoFbGltaXQYAiABKAVSBWxpbWl0');

@$core.Deprecated('Use sortFieldDescriptor instead')
const SortField$json = {
  '1': 'SortField',
  '2': [
    {
      '1': 'sort_kind',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.list.SortKind',
      '10': 'sortKind'
    },
    {'1': 'priority', '3': 2, '4': 1, '5': 5, '10': 'priority'},
  ],
};

/// Descriptor for `SortField`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sortFieldDescriptor = $convert.base64Decode(
    'CglTb3J0RmllbGQSKwoJc29ydF9raW5kGAEgASgOMg4ubGlzdC5Tb3J0S2luZFIIc29ydEtpbm'
    'QSGgoIcHJpb3JpdHkYAiABKAVSCHByaW9yaXR5');
