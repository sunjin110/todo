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

import '../authentication/authentication.pb.dart' as $0;
import '../google/protobuf/timestamp.pb.dart' as $4;
import '../list/list.pb.dart' as $3;
import '../list/list.pbenum.dart' as $3;
import '../user/user.pb.dart' as $1;
import 'todo.pbenum.dart';

export 'todo.pbenum.dart';

class TodoFilter extends $pb.GeneratedMessage {
  factory TodoFilter() => create();
  TodoFilter._() : super();
  factory TodoFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TodoFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TodoFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<TodoId>(1, _omitFieldNames ? '' : 'id', subBuilder: TodoId.create)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..e<$3.FilterKind>(3, _omitFieldNames ? '' : 'titleFilterKind', $pb.PbFieldType.OE, defaultOrMaker: $3.FilterKind.FilterUnknown, valueOf: $3.FilterKind.valueOf, enumValues: $3.FilterKind.values)
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..e<$3.FilterKind>(5, _omitFieldNames ? '' : 'descriptionFilterKind', $pb.PbFieldType.OE, defaultOrMaker: $3.FilterKind.FilterUnknown, valueOf: $3.FilterKind.valueOf, enumValues: $3.FilterKind.values)
    ..e<Status>(6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.done, valueOf: Status.valueOf, enumValues: Status.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TodoFilter clone() => TodoFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TodoFilter copyWith(void Function(TodoFilter) updates) => super.copyWith((message) => updates(message as TodoFilter)) as TodoFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TodoFilter create() => TodoFilter._();
  TodoFilter createEmptyInstance() => create();
  static $pb.PbList<TodoFilter> createRepeated() => $pb.PbList<TodoFilter>();
  @$core.pragma('dart2js:noInline')
  static TodoFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TodoFilter>(create);
  static TodoFilter? _defaultInstance;

  @$pb.TagNumber(1)
  TodoId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id(TodoId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  TodoId ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $3.FilterKind get titleFilterKind => $_getN(2);
  @$pb.TagNumber(3)
  set titleFilterKind($3.FilterKind v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitleFilterKind() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitleFilterKind() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $3.FilterKind get descriptionFilterKind => $_getN(4);
  @$pb.TagNumber(5)
  set descriptionFilterKind($3.FilterKind v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescriptionFilterKind() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescriptionFilterKind() => clearField(5);

  @$pb.TagNumber(6)
  Status get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(Status v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);
}

class TodoSort extends $pb.GeneratedMessage {
  factory TodoSort() => create();
  TodoSort._() : super();
  factory TodoSort.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TodoSort.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TodoSort', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<$3.SortField>(1, _omitFieldNames ? '' : 'createTime', subBuilder: $3.SortField.create)
    ..aOM<$3.SortField>(2, _omitFieldNames ? '' : 'doneTime', subBuilder: $3.SortField.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TodoSort clone() => TodoSort()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TodoSort copyWith(void Function(TodoSort) updates) => super.copyWith((message) => updates(message as TodoSort)) as TodoSort;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TodoSort create() => TodoSort._();
  TodoSort createEmptyInstance() => create();
  static $pb.PbList<TodoSort> createRepeated() => $pb.PbList<TodoSort>();
  @$core.pragma('dart2js:noInline')
  static TodoSort getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TodoSort>(create);
  static TodoSort? _defaultInstance;

  @$pb.TagNumber(1)
  $3.SortField get createTime => $_getN(0);
  @$pb.TagNumber(1)
  set createTime($3.SortField v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreateTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateTime() => clearField(1);
  @$pb.TagNumber(1)
  $3.SortField ensureCreateTime() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.SortField get doneTime => $_getN(1);
  @$pb.TagNumber(2)
  set doneTime($3.SortField v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDoneTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearDoneTime() => clearField(2);
  @$pb.TagNumber(2)
  $3.SortField ensureDoneTime() => $_ensure(1);
}

class ListInput extends $pb.GeneratedMessage {
  factory ListInput() => create();
  ListInput._() : super();
  factory ListInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<$3.Paging>(2, _omitFieldNames ? '' : 'paging', subBuilder: $3.Paging.create)
    ..aOM<TodoFilter>(3, _omitFieldNames ? '' : 'filter', subBuilder: TodoFilter.create)
    ..aOM<TodoSort>(4, _omitFieldNames ? '' : 'sort', subBuilder: TodoSort.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListInput clone() => ListInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListInput copyWith(void Function(ListInput) updates) => super.copyWith((message) => updates(message as ListInput)) as ListInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInput create() => ListInput._();
  ListInput createEmptyInstance() => create();
  static $pb.PbList<ListInput> createRepeated() => $pb.PbList<ListInput>();
  @$core.pragma('dart2js:noInline')
  static ListInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListInput>(create);
  static ListInput? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Session get session => $_getN(0);
  @$pb.TagNumber(1)
  set session($0.Session v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);
  @$pb.TagNumber(1)
  $0.Session ensureSession() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.Paging get paging => $_getN(1);
  @$pb.TagNumber(2)
  set paging($3.Paging v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPaging() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaging() => clearField(2);
  @$pb.TagNumber(2)
  $3.Paging ensurePaging() => $_ensure(1);

  @$pb.TagNumber(3)
  TodoFilter get filter => $_getN(2);
  @$pb.TagNumber(3)
  set filter(TodoFilter v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFilter() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilter() => clearField(3);
  @$pb.TagNumber(3)
  TodoFilter ensureFilter() => $_ensure(2);

  @$pb.TagNumber(4)
  TodoSort get sort => $_getN(3);
  @$pb.TagNumber(4)
  set sort(TodoSort v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSort() => $_has(3);
  @$pb.TagNumber(4)
  void clearSort() => clearField(4);
  @$pb.TagNumber(4)
  TodoSort ensureSort() => $_ensure(3);
}

class ListOutput extends $pb.GeneratedMessage {
  factory ListOutput() => create();
  ListOutput._() : super();
  factory ListOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasNext')
    ..pc<Todo>(2, _omitFieldNames ? '' : 'todos', $pb.PbFieldType.PM, subBuilder: Todo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListOutput clone() => ListOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListOutput copyWith(void Function(ListOutput) updates) => super.copyWith((message) => updates(message as ListOutput)) as ListOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListOutput create() => ListOutput._();
  ListOutput createEmptyInstance() => create();
  static $pb.PbList<ListOutput> createRepeated() => $pb.PbList<ListOutput>();
  @$core.pragma('dart2js:noInline')
  static ListOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListOutput>(create);
  static ListOutput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasNext => $_getBF(0);
  @$pb.TagNumber(1)
  set hasNext($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHasNext() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasNext() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Todo> get todos => $_getList(1);
}

class GetInput extends $pb.GeneratedMessage {
  factory GetInput() => create();
  GetInput._() : super();
  factory GetInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<TodoId>(2, _omitFieldNames ? '' : 'id', subBuilder: TodoId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInput clone() => GetInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInput copyWith(void Function(GetInput) updates) => super.copyWith((message) => updates(message as GetInput)) as GetInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInput create() => GetInput._();
  GetInput createEmptyInstance() => create();
  static $pb.PbList<GetInput> createRepeated() => $pb.PbList<GetInput>();
  @$core.pragma('dart2js:noInline')
  static GetInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInput>(create);
  static GetInput? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Session get session => $_getN(0);
  @$pb.TagNumber(1)
  set session($0.Session v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);
  @$pb.TagNumber(1)
  $0.Session ensureSession() => $_ensure(0);

  @$pb.TagNumber(2)
  TodoId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id(TodoId v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
  @$pb.TagNumber(2)
  TodoId ensureId() => $_ensure(1);
}

class GetOutput extends $pb.GeneratedMessage {
  factory GetOutput() => create();
  GetOutput._() : super();
  factory GetOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<Todo>(1, _omitFieldNames ? '' : 'todo', subBuilder: Todo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOutput clone() => GetOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOutput copyWith(void Function(GetOutput) updates) => super.copyWith((message) => updates(message as GetOutput)) as GetOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOutput create() => GetOutput._();
  GetOutput createEmptyInstance() => create();
  static $pb.PbList<GetOutput> createRepeated() => $pb.PbList<GetOutput>();
  @$core.pragma('dart2js:noInline')
  static GetOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOutput>(create);
  static GetOutput? _defaultInstance;

  @$pb.TagNumber(1)
  Todo get todo => $_getN(0);
  @$pb.TagNumber(1)
  set todo(Todo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTodo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTodo() => clearField(1);
  @$pb.TagNumber(1)
  Todo ensureTodo() => $_ensure(0);
}

class CreateInput extends $pb.GeneratedMessage {
  factory CreateInput() => create();
  CreateInput._() : super();
  factory CreateInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<CreateTodo>(2, _omitFieldNames ? '' : 'todo', subBuilder: CreateTodo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateInput clone() => CreateInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateInput copyWith(void Function(CreateInput) updates) => super.copyWith((message) => updates(message as CreateInput)) as CreateInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInput create() => CreateInput._();
  CreateInput createEmptyInstance() => create();
  static $pb.PbList<CreateInput> createRepeated() => $pb.PbList<CreateInput>();
  @$core.pragma('dart2js:noInline')
  static CreateInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateInput>(create);
  static CreateInput? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Session get session => $_getN(0);
  @$pb.TagNumber(1)
  set session($0.Session v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);
  @$pb.TagNumber(1)
  $0.Session ensureSession() => $_ensure(0);

  @$pb.TagNumber(2)
  CreateTodo get todo => $_getN(1);
  @$pb.TagNumber(2)
  set todo(CreateTodo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTodo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTodo() => clearField(2);
  @$pb.TagNumber(2)
  CreateTodo ensureTodo() => $_ensure(1);
}

class CreateOutput extends $pb.GeneratedMessage {
  factory CreateOutput() => create();
  CreateOutput._() : super();
  factory CreateOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateOutput clone() => CreateOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateOutput copyWith(void Function(CreateOutput) updates) => super.copyWith((message) => updates(message as CreateOutput)) as CreateOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOutput create() => CreateOutput._();
  CreateOutput createEmptyInstance() => create();
  static $pb.PbList<CreateOutput> createRepeated() => $pb.PbList<CreateOutput>();
  @$core.pragma('dart2js:noInline')
  static CreateOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateOutput>(create);
  static CreateOutput? _defaultInstance;
}

class UpdateInput extends $pb.GeneratedMessage {
  factory UpdateInput() => create();
  UpdateInput._() : super();
  factory UpdateInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<UpdateTodo>(2, _omitFieldNames ? '' : 'todo', subBuilder: UpdateTodo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateInput clone() => UpdateInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateInput copyWith(void Function(UpdateInput) updates) => super.copyWith((message) => updates(message as UpdateInput)) as UpdateInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInput create() => UpdateInput._();
  UpdateInput createEmptyInstance() => create();
  static $pb.PbList<UpdateInput> createRepeated() => $pb.PbList<UpdateInput>();
  @$core.pragma('dart2js:noInline')
  static UpdateInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateInput>(create);
  static UpdateInput? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Session get session => $_getN(0);
  @$pb.TagNumber(1)
  set session($0.Session v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);
  @$pb.TagNumber(1)
  $0.Session ensureSession() => $_ensure(0);

  @$pb.TagNumber(2)
  UpdateTodo get todo => $_getN(1);
  @$pb.TagNumber(2)
  set todo(UpdateTodo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTodo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTodo() => clearField(2);
  @$pb.TagNumber(2)
  UpdateTodo ensureTodo() => $_ensure(1);
}

class UpdateOutput extends $pb.GeneratedMessage {
  factory UpdateOutput() => create();
  UpdateOutput._() : super();
  factory UpdateOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateOutput clone() => UpdateOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateOutput copyWith(void Function(UpdateOutput) updates) => super.copyWith((message) => updates(message as UpdateOutput)) as UpdateOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateOutput create() => UpdateOutput._();
  UpdateOutput createEmptyInstance() => create();
  static $pb.PbList<UpdateOutput> createRepeated() => $pb.PbList<UpdateOutput>();
  @$core.pragma('dart2js:noInline')
  static UpdateOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateOutput>(create);
  static UpdateOutput? _defaultInstance;
}

class DeleteInput extends $pb.GeneratedMessage {
  factory DeleteInput() => create();
  DeleteInput._() : super();
  factory DeleteInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<TodoId>(2, _omitFieldNames ? '' : 'id', subBuilder: TodoId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteInput clone() => DeleteInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteInput copyWith(void Function(DeleteInput) updates) => super.copyWith((message) => updates(message as DeleteInput)) as DeleteInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteInput create() => DeleteInput._();
  DeleteInput createEmptyInstance() => create();
  static $pb.PbList<DeleteInput> createRepeated() => $pb.PbList<DeleteInput>();
  @$core.pragma('dart2js:noInline')
  static DeleteInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteInput>(create);
  static DeleteInput? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Session get session => $_getN(0);
  @$pb.TagNumber(1)
  set session($0.Session v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);
  @$pb.TagNumber(1)
  $0.Session ensureSession() => $_ensure(0);

  @$pb.TagNumber(2)
  TodoId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id(TodoId v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
  @$pb.TagNumber(2)
  TodoId ensureId() => $_ensure(1);
}

class DeleteOutput extends $pb.GeneratedMessage {
  factory DeleteOutput() => create();
  DeleteOutput._() : super();
  factory DeleteOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteOutput clone() => DeleteOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteOutput copyWith(void Function(DeleteOutput) updates) => super.copyWith((message) => updates(message as DeleteOutput)) as DeleteOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteOutput create() => DeleteOutput._();
  DeleteOutput createEmptyInstance() => create();
  static $pb.PbList<DeleteOutput> createRepeated() => $pb.PbList<DeleteOutput>();
  @$core.pragma('dart2js:noInline')
  static DeleteOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteOutput>(create);
  static DeleteOutput? _defaultInstance;
}

class TodoId extends $pb.GeneratedMessage {
  factory TodoId() => create();
  TodoId._() : super();
  factory TodoId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TodoId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TodoId', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TodoId clone() => TodoId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TodoId copyWith(void Function(TodoId) updates) => super.copyWith((message) => updates(message as TodoId)) as TodoId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TodoId create() => TodoId._();
  TodoId createEmptyInstance() => create();
  static $pb.PbList<TodoId> createRepeated() => $pb.PbList<TodoId>();
  @$core.pragma('dart2js:noInline')
  static TodoId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TodoId>(create);
  static TodoId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class CreateTodo extends $pb.GeneratedMessage {
  factory CreateTodo() => create();
  CreateTodo._() : super();
  factory CreateTodo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTodo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTodo', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..e<Status>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.done, valueOf: Status.valueOf, enumValues: Status.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTodo clone() => CreateTodo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTodo copyWith(void Function(CreateTodo) updates) => super.copyWith((message) => updates(message as CreateTodo)) as CreateTodo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTodo create() => CreateTodo._();
  CreateTodo createEmptyInstance() => create();
  static $pb.PbList<CreateTodo> createRepeated() => $pb.PbList<CreateTodo>();
  @$core.pragma('dart2js:noInline')
  static CreateTodo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTodo>(create);
  static CreateTodo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  Status get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(Status v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class UpdateTodo extends $pb.GeneratedMessage {
  factory UpdateTodo() => create();
  UpdateTodo._() : super();
  factory UpdateTodo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTodo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTodo', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<TodoId>(1, _omitFieldNames ? '' : 'id', subBuilder: TodoId.create)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..e<Status>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.done, valueOf: Status.valueOf, enumValues: Status.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTodo clone() => UpdateTodo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTodo copyWith(void Function(UpdateTodo) updates) => super.copyWith((message) => updates(message as UpdateTodo)) as UpdateTodo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTodo create() => UpdateTodo._();
  UpdateTodo createEmptyInstance() => create();
  static $pb.PbList<UpdateTodo> createRepeated() => $pb.PbList<UpdateTodo>();
  @$core.pragma('dart2js:noInline')
  static UpdateTodo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTodo>(create);
  static UpdateTodo? _defaultInstance;

  @$pb.TagNumber(1)
  TodoId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id(TodoId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  TodoId ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  Status get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(Status v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);
}

class Todo extends $pb.GeneratedMessage {
  factory Todo() => create();
  Todo._() : super();
  factory Todo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Todo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Todo', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..aOM<TodoId>(1, _omitFieldNames ? '' : 'id', subBuilder: TodoId.create)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..e<Status>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.done, valueOf: Status.valueOf, enumValues: Status.values)
    ..aOM<$1.UserId>(5, _omitFieldNames ? '' : 'userId', subBuilder: $1.UserId.create)
    ..aOM<$4.Timestamp>(6, _omitFieldNames ? '' : 'createTime', subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Todo clone() => Todo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Todo copyWith(void Function(Todo) updates) => super.copyWith((message) => updates(message as Todo)) as Todo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Todo create() => Todo._();
  Todo createEmptyInstance() => create();
  static $pb.PbList<Todo> createRepeated() => $pb.PbList<Todo>();
  @$core.pragma('dart2js:noInline')
  static Todo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Todo>(create);
  static Todo? _defaultInstance;

  @$pb.TagNumber(1)
  TodoId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id(TodoId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  TodoId ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  Status get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(Status v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $1.UserId get userId => $_getN(4);
  @$pb.TagNumber(5)
  set userId($1.UserId v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserId() => clearField(5);
  @$pb.TagNumber(5)
  $1.UserId ensureUserId() => $_ensure(4);

  @$pb.TagNumber(6)
  $4.Timestamp get createTime => $_getN(5);
  @$pb.TagNumber(6)
  set createTime($4.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);
  @$pb.TagNumber(6)
  $4.Timestamp ensureCreateTime() => $_ensure(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
