//
//  Generated code. Do not modify.
//  source: list/list.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FilterKind extends $pb.ProtobufEnum {
  static const FilterKind FilterUnknown =
      FilterKind._(0, _omitEnumNames ? '' : 'FilterUnknown');
  static const FilterKind FilterPartialMatch =
      FilterKind._(1, _omitEnumNames ? '' : 'FilterPartialMatch');
  static const FilterKind FilterPerfectMatch =
      FilterKind._(2, _omitEnumNames ? '' : 'FilterPerfectMatch');

  static const $core.List<FilterKind> values = <FilterKind>[
    FilterUnknown,
    FilterPartialMatch,
    FilterPerfectMatch,
  ];

  static final $core.Map<$core.int, FilterKind> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static FilterKind? valueOf($core.int value) => _byValue[value];

  const FilterKind._($core.int v, $core.String n) : super(v, n);
}

class SortKind extends $pb.ProtobufEnum {
  static const SortKind FilterAsc =
      SortKind._(0, _omitEnumNames ? '' : 'FilterAsc');
  static const SortKind FilterDesc =
      SortKind._(1, _omitEnumNames ? '' : 'FilterDesc');

  static const $core.List<SortKind> values = <SortKind>[
    FilterAsc,
    FilterDesc,
  ];

  static final $core.Map<$core.int, SortKind> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SortKind? valueOf($core.int value) => _byValue[value];

  const SortKind._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
