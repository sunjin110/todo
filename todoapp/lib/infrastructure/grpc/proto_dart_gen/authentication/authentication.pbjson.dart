//
//  Generated code. Do not modify.
//  source: authentication/authentication.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userSignUpStatusDescriptor instead')
const UserSignUpStatus$json = {
  '1': 'UserSignUpStatus',
  '2': [
    {'1': 'SignupSignUpStatusUnknown', '2': 0},
    {'1': 'SignupSignUpStatusAllowed', '2': 1},
    {'1': 'SignupSignUpStatusWaitForAllow', '2': 2},
    {'1': 'SignupSignUpStatusDenied', '2': 3},
  ],
};

/// Descriptor for `UserSignUpStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List userSignUpStatusDescriptor = $convert.base64Decode(
    'ChBVc2VyU2lnblVwU3RhdHVzEh0KGVNpZ251cFNpZ25VcFN0YXR1c1Vua25vd24QABIdChlTaW'
    'dudXBTaWduVXBTdGF0dXNBbGxvd2VkEAESIgoeU2lnbnVwU2lnblVwU3RhdHVzV2FpdEZvckFs'
    'bG93EAISHAoYU2lnbnVwU2lnblVwU3RhdHVzRGVuaWVkEAM=');

@$core.Deprecated('Use signUpInputDescriptor instead')
const SignUpInput$json = {
  '1': 'SignUpInput',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `SignUpInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpInputDescriptor = $convert.base64Decode(
    'CgtTaWduVXBJbnB1dBISCgRuYW1lGAEgASgJUgRuYW1lEhQKBWVtYWlsGAIgASgJUgVlbWFpbB'
    'IaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use signUpOutputDescriptor instead')
const SignUpOutput$json = {
  '1': 'SignUpOutput',
  '2': [
    {
      '1': 'session',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.authentication.Session',
      '9': 0,
      '10': 'session',
      '17': true
    },
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.authentication.UserSignUpStatus',
      '10': 'status'
    },
  ],
  '8': [
    {'1': '_session'},
  ],
};

/// Descriptor for `SignUpOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpOutputDescriptor = $convert.base64Decode(
    'CgxTaWduVXBPdXRwdXQSNgoHc2Vzc2lvbhgBIAEoCzIXLmF1dGhlbnRpY2F0aW9uLlNlc3Npb2'
    '5IAFIHc2Vzc2lvbogBARI4CgZzdGF0dXMYAiABKA4yIC5hdXRoZW50aWNhdGlvbi5Vc2VyU2ln'
    'blVwU3RhdHVzUgZzdGF0dXNCCgoIX3Nlc3Npb24=');

@$core.Deprecated('Use signInInputDescriptor instead')
const SignInInput$json = {
  '1': 'SignInInput',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `SignInInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signInInputDescriptor = $convert.base64Decode(
    'CgtTaWduSW5JbnB1dBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGgoIcGFzc3dvcmQYAiABKAlSCH'
    'Bhc3N3b3Jk');

@$core.Deprecated('Use signInOutputDescriptor instead')
const SignInOutput$json = {
  '1': 'SignInOutput',
  '2': [
    {
      '1': 'session',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.authentication.Session',
      '10': 'session'
    },
  ],
};

/// Descriptor for `SignInOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signInOutputDescriptor = $convert.base64Decode(
    'CgxTaWduSW5PdXRwdXQSMQoHc2Vzc2lvbhgBIAEoCzIXLmF1dGhlbnRpY2F0aW9uLlNlc3Npb2'
    '5SB3Nlc3Npb24=');

@$core.Deprecated('Use signOutInputDescriptor instead')
const SignOutInput$json = {
  '1': 'SignOutInput',
  '2': [
    {
      '1': 'session',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.authentication.Session',
      '10': 'session'
    },
  ],
};

/// Descriptor for `SignOutInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signOutInputDescriptor = $convert.base64Decode(
    'CgxTaWduT3V0SW5wdXQSMQoHc2Vzc2lvbhgBIAEoCzIXLmF1dGhlbnRpY2F0aW9uLlNlc3Npb2'
    '5SB3Nlc3Npb24=');

@$core.Deprecated('Use signOutOutputDescriptor instead')
const SignOutOutput$json = {
  '1': 'SignOutOutput',
};

/// Descriptor for `SignOutOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signOutOutputDescriptor =
    $convert.base64Decode('Cg1TaWduT3V0T3V0cHV0');

@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = {
  '1': 'Session',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
    {
      '1': 'expire_time',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 0,
      '10': 'expireTime',
      '17': true
    },
  ],
  '8': [
    {'1': '_expire_time'},
  ],
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode(
    'CgdTZXNzaW9uEhgKB3Nlc3Npb24YASABKAlSB3Nlc3Npb24SQAoLZXhwaXJlX3RpbWUYAiABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSCmV4cGlyZVRpbWWIAQFCDgoMX2V4cGly'
    'ZV90aW1l');
