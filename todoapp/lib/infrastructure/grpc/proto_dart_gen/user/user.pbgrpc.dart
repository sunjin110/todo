//
//  Generated code. Do not modify.
//  source: user/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $1;

export 'user.pb.dart';

@$pb.GrpcServiceName('user.UserRpc')
class UserRpcClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$1.CreateInput, $1.CreateOutput>(
      '/user.UserRpc/Create',
      ($1.CreateInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CreateOutput.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$1.UpdateInput, $1.UpdateOutput>(
      '/user.UserRpc/Update',
      ($1.UpdateInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UpdateOutput.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$1.DeleteInput, $1.DeleteOutput>(
      '/user.UserRpc/Delete',
      ($1.DeleteInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DeleteOutput.fromBuffer(value));
  static final _$get = $grpc.ClientMethod<$1.GetInput, $1.GetOutput>(
      '/user.UserRpc/Get',
      ($1.GetInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetOutput.fromBuffer(value));
  static final _$list = $grpc.ClientMethod<$1.ListInput, $1.ListOutput>(
      '/user.UserRpc/List',
      ($1.ListInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListOutput.fromBuffer(value));

  UserRpcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.CreateOutput> create($1.CreateInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$1.UpdateOutput> update($1.UpdateInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$1.DeleteOutput> delete($1.DeleteInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetOutput> get($1.GetInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListOutput> list($1.ListInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$list, request, options: options);
  }
}

@$pb.GrpcServiceName('user.UserRpc')
abstract class UserRpcServiceBase extends $grpc.Service {
  $core.String get $name => 'user.UserRpc';

  UserRpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CreateInput, $1.CreateOutput>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateInput.fromBuffer(value),
        ($1.CreateOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateInput, $1.UpdateOutput>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UpdateInput.fromBuffer(value),
        ($1.UpdateOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteInput, $1.DeleteOutput>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteInput.fromBuffer(value),
        ($1.DeleteOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetInput, $1.GetOutput>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetInput.fromBuffer(value),
        ($1.GetOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ListInput, $1.ListOutput>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ListInput.fromBuffer(value),
        ($1.ListOutput value) => value.writeToBuffer()));
  }

  $async.Future<$1.CreateOutput> create_Pre(
      $grpc.ServiceCall call, $async.Future<$1.CreateInput> request) async {
    return create(call, await request);
  }

  $async.Future<$1.UpdateOutput> update_Pre(
      $grpc.ServiceCall call, $async.Future<$1.UpdateInput> request) async {
    return update(call, await request);
  }

  $async.Future<$1.DeleteOutput> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$1.DeleteInput> request) async {
    return delete(call, await request);
  }

  $async.Future<$1.GetOutput> get_Pre(
      $grpc.ServiceCall call, $async.Future<$1.GetInput> request) async {
    return get(call, await request);
  }

  $async.Future<$1.ListOutput> list_Pre(
      $grpc.ServiceCall call, $async.Future<$1.ListInput> request) async {
    return list(call, await request);
  }

  $async.Future<$1.CreateOutput> create(
      $grpc.ServiceCall call, $1.CreateInput request);
  $async.Future<$1.UpdateOutput> update(
      $grpc.ServiceCall call, $1.UpdateInput request);
  $async.Future<$1.DeleteOutput> delete(
      $grpc.ServiceCall call, $1.DeleteInput request);
  $async.Future<$1.GetOutput> get($grpc.ServiceCall call, $1.GetInput request);
  $async.Future<$1.ListOutput> list(
      $grpc.ServiceCall call, $1.ListInput request);
}
