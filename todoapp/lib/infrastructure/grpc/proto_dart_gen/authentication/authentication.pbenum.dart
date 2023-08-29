//
//  Generated code. Do not modify.
//  source: authentication/authentication.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UserSignUpStatus extends $pb.ProtobufEnum {
  static const UserSignUpStatus SignupSignUpStatusUnknown = UserSignUpStatus._(0, _omitEnumNames ? '' : 'SignupSignUpStatusUnknown');
  static const UserSignUpStatus SignupSignUpStatusAllowed = UserSignUpStatus._(1, _omitEnumNames ? '' : 'SignupSignUpStatusAllowed');
  static const UserSignUpStatus SignupSignUpStatusWaitForAllow = UserSignUpStatus._(2, _omitEnumNames ? '' : 'SignupSignUpStatusWaitForAllow');
  static const UserSignUpStatus SignupSignUpStatusDenied = UserSignUpStatus._(3, _omitEnumNames ? '' : 'SignupSignUpStatusDenied');

  static const $core.List<UserSignUpStatus> values = <UserSignUpStatus> [
    SignupSignUpStatusUnknown,
    SignupSignUpStatusAllowed,
    SignupSignUpStatusWaitForAllow,
    SignupSignUpStatusDenied,
  ];

  static final $core.Map<$core.int, UserSignUpStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserSignUpStatus? valueOf($core.int value) => _byValue[value];

  const UserSignUpStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
