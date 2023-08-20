//
//  Generated code. Do not modify.
//  source: todo/todo.proto
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

import 'todo.pb.dart' as $2;

export 'todo.pb.dart';

@$pb.GrpcServiceName('todo.TodoRpc')
class TodoRpcClient extends $grpc.Client {
  static final _$list = $grpc.ClientMethod<$2.ListInput, $2.ListOutput>(
      '/todo.TodoRpc/List',
      ($2.ListInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListOutput.fromBuffer(value));
  static final _$get = $grpc.ClientMethod<$2.GetInput, $2.GetOutput>(
      '/todo.TodoRpc/Get',
      ($2.GetInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetOutput.fromBuffer(value));
  static final _$create = $grpc.ClientMethod<$2.CreateInput, $2.CreateOutput>(
      '/todo.TodoRpc/Create',
      ($2.CreateInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CreateOutput.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$2.UpdateInput, $2.UpdateOutput>(
      '/todo.TodoRpc/Update',
      ($2.UpdateInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.UpdateOutput.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$2.DeleteInput, $2.DeleteOutput>(
      '/todo.TodoRpc/Delete',
      ($2.DeleteInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.DeleteOutput.fromBuffer(value));

  TodoRpcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.ListOutput> list($2.ListInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetOutput> get($2.GetInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$2.CreateOutput> create($2.CreateInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$2.UpdateOutput> update($2.UpdateInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$2.DeleteOutput> delete($2.DeleteInput request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }
}

@$pb.GrpcServiceName('todo.TodoRpc')
abstract class TodoRpcServiceBase extends $grpc.Service {
  $core.String get $name => 'todo.TodoRpc';

  TodoRpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.ListInput, $2.ListOutput>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListInput.fromBuffer(value),
        ($2.ListOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetInput, $2.GetOutput>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetInput.fromBuffer(value),
        ($2.GetOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CreateInput, $2.CreateOutput>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateInput.fromBuffer(value),
        ($2.CreateOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdateInput, $2.UpdateOutput>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdateInput.fromBuffer(value),
        ($2.UpdateOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteInput, $2.DeleteOutput>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeleteInput.fromBuffer(value),
        ($2.DeleteOutput value) => value.writeToBuffer()));
  }

  $async.Future<$2.ListOutput> list_Pre(
      $grpc.ServiceCall call, $async.Future<$2.ListInput> request) async {
    return list(call, await request);
  }

  $async.Future<$2.GetOutput> get_Pre(
      $grpc.ServiceCall call, $async.Future<$2.GetInput> request) async {
    return get(call, await request);
  }

  $async.Future<$2.CreateOutput> create_Pre(
      $grpc.ServiceCall call, $async.Future<$2.CreateInput> request) async {
    return create(call, await request);
  }

  $async.Future<$2.UpdateOutput> update_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UpdateInput> request) async {
    return update(call, await request);
  }

  $async.Future<$2.DeleteOutput> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$2.DeleteInput> request) async {
    return delete(call, await request);
  }

  $async.Future<$2.ListOutput> list(
      $grpc.ServiceCall call, $2.ListInput request);
  $async.Future<$2.GetOutput> get($grpc.ServiceCall call, $2.GetInput request);
  $async.Future<$2.CreateOutput> create(
      $grpc.ServiceCall call, $2.CreateInput request);
  $async.Future<$2.UpdateOutput> update(
      $grpc.ServiceCall call, $2.UpdateInput request);
  $async.Future<$2.DeleteOutput> delete(
      $grpc.ServiceCall call, $2.DeleteInput request);
}
