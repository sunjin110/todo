//
//  Generated code. Do not modify.
//  source: todo/todo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Status extends $pb.ProtobufEnum {
  static const Status done = Status._(0, _omitEnumNames ? '' : 'done');
  static const Status scheduled = Status._(1, _omitEnumNames ? '' : 'scheduled');
  static const Status draft = Status._(2, _omitEnumNames ? '' : 'draft');

  static const $core.List<Status> values = <Status> [
    done,
    scheduled,
    draft,
  ];

  static final $core.Map<$core.int, Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Status? valueOf($core.int value) => _byValue[value];

  const Status._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
