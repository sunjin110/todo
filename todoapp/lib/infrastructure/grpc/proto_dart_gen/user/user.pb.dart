//
//  Generated code. Do not modify.
//  source: user/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../authentication/authentication.pb.dart' as $0;
import '../authentication/authentication.pbenum.dart' as $0;
import '../list/list.pb.dart' as $2;
import '../list/list.pbenum.dart' as $2;

class UserId extends $pb.GeneratedMessage {
  factory UserId() => create();
  UserId._() : super();
  factory UserId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserId', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserId clone() => UserId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserId copyWith(void Function(UserId) updates) => super.copyWith((message) => updates(message as UserId)) as UserId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserId create() => UserId._();
  UserId createEmptyInstance() => create();
  static $pb.PbList<UserId> createRepeated() => $pb.PbList<UserId>();
  @$core.pragma('dart2js:noInline')
  static UserId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserId>(create);
  static UserId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class User extends $pb.GeneratedMessage {
  factory User() => create();
  User._() : super();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'User', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<UserId>(1, _omitFieldNames ? '' : 'id', subBuilder: UserId.create)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..e<$0.UserSignUpStatus>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.UserSignUpStatus.SignupSignUpStatusUnknown, valueOf: $0.UserSignUpStatus.valueOf, enumValues: $0.UserSignUpStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  UserId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id(UserId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  UserId ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $0.UserSignUpStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status($0.UserSignUpStatus v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);
}

class CreateUser extends $pb.GeneratedMessage {
  factory CreateUser() => create();
  CreateUser._() : super();
  factory CreateUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..e<$0.UserSignUpStatus>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.UserSignUpStatus.SignupSignUpStatusUnknown, valueOf: $0.UserSignUpStatus.valueOf, enumValues: $0.UserSignUpStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUser clone() => CreateUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUser copyWith(void Function(CreateUser) updates) => super.copyWith((message) => updates(message as CreateUser)) as CreateUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUser create() => CreateUser._();
  CreateUser createEmptyInstance() => create();
  static $pb.PbList<CreateUser> createRepeated() => $pb.PbList<CreateUser>();
  @$core.pragma('dart2js:noInline')
  static CreateUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUser>(create);
  static CreateUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $0.UserSignUpStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status($0.UserSignUpStatus v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);
}

class UpdateUser extends $pb.GeneratedMessage {
  factory UpdateUser() => create();
  UpdateUser._() : super();
  factory UpdateUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<UserId>(1, _omitFieldNames ? '' : 'id', subBuilder: UserId.create)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'password')
    ..e<$0.UserSignUpStatus>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.UserSignUpStatus.SignupSignUpStatusUnknown, valueOf: $0.UserSignUpStatus.valueOf, enumValues: $0.UserSignUpStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUser clone() => UpdateUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUser copyWith(void Function(UpdateUser) updates) => super.copyWith((message) => updates(message as UpdateUser)) as UpdateUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUser create() => UpdateUser._();
  UpdateUser createEmptyInstance() => create();
  static $pb.PbList<UpdateUser> createRepeated() => $pb.PbList<UpdateUser>();
  @$core.pragma('dart2js:noInline')
  static UpdateUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUser>(create);
  static UpdateUser? _defaultInstance;

  @$pb.TagNumber(1)
  UserId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id(UserId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  UserId ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(3);
  @$pb.TagNumber(4)
  set password($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassword() => clearField(4);

  @$pb.TagNumber(5)
  $0.UserSignUpStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status($0.UserSignUpStatus v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
}

class CreateInput extends $pb.GeneratedMessage {
  factory CreateInput() => create();
  CreateInput._() : super();
  factory CreateInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<CreateUser>(2, _omitFieldNames ? '' : 'user', subBuilder: CreateUser.create)
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
  CreateUser get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(CreateUser v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  CreateUser ensureUser() => $_ensure(1);
}

class CreateOutput extends $pb.GeneratedMessage {
  factory CreateOutput() => create();
  CreateOutput._() : super();
  factory CreateOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<UpdateUser>(2, _omitFieldNames ? '' : 'user', subBuilder: UpdateUser.create)
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
  UpdateUser get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(UpdateUser v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  UpdateUser ensureUser() => $_ensure(1);
}

class UpdateOutput extends $pb.GeneratedMessage {
  factory UpdateOutput() => create();
  UpdateOutput._() : super();
  factory UpdateOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<UserId>(2, _omitFieldNames ? '' : 'id', subBuilder: UserId.create)
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
  UserId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id(UserId v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
  @$pb.TagNumber(2)
  UserId ensureId() => $_ensure(1);
}

class DeleteOutput extends $pb.GeneratedMessage {
  factory DeleteOutput() => create();
  DeleteOutput._() : super();
  factory DeleteOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
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

class UserFilter extends $pb.GeneratedMessage {
  factory UserFilter() => create();
  UserFilter._() : super();
  factory UserFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<UserId>(1, _omitFieldNames ? '' : 'id', subBuilder: UserId.create)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..e<$2.FilterKind>(3, _omitFieldNames ? '' : 'nameFilterKind', $pb.PbFieldType.OE, defaultOrMaker: $2.FilterKind.FilterUnknown, valueOf: $2.FilterKind.valueOf, enumValues: $2.FilterKind.values)
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..e<$2.FilterKind>(5, _omitFieldNames ? '' : 'emailFilterKind', $pb.PbFieldType.OE, defaultOrMaker: $2.FilterKind.FilterUnknown, valueOf: $2.FilterKind.valueOf, enumValues: $2.FilterKind.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserFilter clone() => UserFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserFilter copyWith(void Function(UserFilter) updates) => super.copyWith((message) => updates(message as UserFilter)) as UserFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserFilter create() => UserFilter._();
  UserFilter createEmptyInstance() => create();
  static $pb.PbList<UserFilter> createRepeated() => $pb.PbList<UserFilter>();
  @$core.pragma('dart2js:noInline')
  static UserFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserFilter>(create);
  static UserFilter? _defaultInstance;

  @$pb.TagNumber(1)
  UserId get id => $_getN(0);
  @$pb.TagNumber(1)
  set id(UserId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  UserId ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $2.FilterKind get nameFilterKind => $_getN(2);
  @$pb.TagNumber(3)
  set nameFilterKind($2.FilterKind v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameFilterKind() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameFilterKind() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $2.FilterKind get emailFilterKind => $_getN(4);
  @$pb.TagNumber(5)
  set emailFilterKind($2.FilterKind v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmailFilterKind() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmailFilterKind() => clearField(5);
}

class UserSort extends $pb.GeneratedMessage {
  factory UserSort() => create();
  UserSort._() : super();
  factory UserSort.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSort.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserSort', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<$2.SortField>(1, _omitFieldNames ? '' : 'lastLogin', subBuilder: $2.SortField.create)
    ..aOM<$2.SortField>(2, _omitFieldNames ? '' : 'createTime', subBuilder: $2.SortField.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserSort clone() => UserSort()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserSort copyWith(void Function(UserSort) updates) => super.copyWith((message) => updates(message as UserSort)) as UserSort;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserSort create() => UserSort._();
  UserSort createEmptyInstance() => create();
  static $pb.PbList<UserSort> createRepeated() => $pb.PbList<UserSort>();
  @$core.pragma('dart2js:noInline')
  static UserSort getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserSort>(create);
  static UserSort? _defaultInstance;

  @$pb.TagNumber(1)
  $2.SortField get lastLogin => $_getN(0);
  @$pb.TagNumber(1)
  set lastLogin($2.SortField v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastLogin() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastLogin() => clearField(1);
  @$pb.TagNumber(1)
  $2.SortField ensureLastLogin() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.SortField get createTime => $_getN(1);
  @$pb.TagNumber(2)
  set createTime($2.SortField v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreateTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateTime() => clearField(2);
  @$pb.TagNumber(2)
  $2.SortField ensureCreateTime() => $_ensure(1);
}

class ListInput extends $pb.GeneratedMessage {
  factory ListInput() => create();
  ListInput._() : super();
  factory ListInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<$2.Paging>(2, _omitFieldNames ? '' : 'paging', subBuilder: $2.Paging.create)
    ..aOM<UserFilter>(3, _omitFieldNames ? '' : 'filter', subBuilder: UserFilter.create)
    ..aOM<UserSort>(4, _omitFieldNames ? '' : 'sort', subBuilder: UserSort.create)
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
  $2.Paging get paging => $_getN(1);
  @$pb.TagNumber(2)
  set paging($2.Paging v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPaging() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaging() => clearField(2);
  @$pb.TagNumber(2)
  $2.Paging ensurePaging() => $_ensure(1);

  @$pb.TagNumber(3)
  UserFilter get filter => $_getN(2);
  @$pb.TagNumber(3)
  set filter(UserFilter v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFilter() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilter() => clearField(3);
  @$pb.TagNumber(3)
  UserFilter ensureFilter() => $_ensure(2);

  @$pb.TagNumber(4)
  UserSort get sort => $_getN(3);
  @$pb.TagNumber(4)
  set sort(UserSort v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSort() => $_has(3);
  @$pb.TagNumber(4)
  void clearSort() => clearField(4);
  @$pb.TagNumber(4)
  UserSort ensureSort() => $_ensure(3);
}

class ListOutput extends $pb.GeneratedMessage {
  factory ListOutput() => create();
  ListOutput._() : super();
  factory ListOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasNext')
    ..pc<User>(2, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: User.create)
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
  $core.List<User> get users => $_getList(1);
}

class GetInput extends $pb.GeneratedMessage {
  factory GetInput() => create();
  GetInput._() : super();
  factory GetInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<$0.Session>(1, _omitFieldNames ? '' : 'session', subBuilder: $0.Session.create)
    ..aOM<UserId>(2, _omitFieldNames ? '' : 'id', subBuilder: UserId.create)
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
  UserId get id => $_getN(1);
  @$pb.TagNumber(2)
  set id(UserId v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
  @$pb.TagNumber(2)
  UserId ensureId() => $_ensure(1);
}

class GetOutput extends $pb.GeneratedMessage {
  factory GetOutput() => create();
  GetOutput._() : super();
  factory GetOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
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
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
