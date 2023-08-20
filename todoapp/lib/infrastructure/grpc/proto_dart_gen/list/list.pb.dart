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

import 'list.pbenum.dart';

export 'list.pbenum.dart';

class Paging extends $pb.GeneratedMessage {
  factory Paging() => create();
  Paging._() : super();
  factory Paging.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Paging.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Paging',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'list'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Paging clone() => Paging()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Paging copyWith(void Function(Paging) updates) =>
      super.copyWith((message) => updates(message as Paging)) as Paging;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Paging create() => Paging._();
  Paging createEmptyInstance() => create();
  static $pb.PbList<Paging> createRepeated() => $pb.PbList<Paging>();
  @$core.pragma('dart2js:noInline')
  static Paging getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Paging>(create);
  static Paging? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get offset => $_getIZ(0);
  @$pb.TagNumber(1)
  set offset($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class SortField extends $pb.GeneratedMessage {
  factory SortField() => create();
  SortField._() : super();
  factory SortField.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SortField.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SortField',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'list'),
      createEmptyInstance: create)
    ..e<SortKind>(1, _omitFieldNames ? '' : 'sortKind', $pb.PbFieldType.OE,
        defaultOrMaker: SortKind.FilterAsc,
        valueOf: SortKind.valueOf,
        enumValues: SortKind.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SortField clone() => SortField()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SortField copyWith(void Function(SortField) updates) =>
      super.copyWith((message) => updates(message as SortField)) as SortField;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SortField create() => SortField._();
  SortField createEmptyInstance() => create();
  static $pb.PbList<SortField> createRepeated() => $pb.PbList<SortField>();
  @$core.pragma('dart2js:noInline')
  static SortField getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SortField>(create);
  static SortField? _defaultInstance;

  @$pb.TagNumber(1)
  SortKind get sortKind => $_getN(0);
  @$pb.TagNumber(1)
  set sortKind(SortKind v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSortKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearSortKind() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get priority => $_getIZ(1);
  @$pb.TagNumber(2)
  set priority($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPriority() => $_has(1);
  @$pb.TagNumber(2)
  void clearPriority() => clearField(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
