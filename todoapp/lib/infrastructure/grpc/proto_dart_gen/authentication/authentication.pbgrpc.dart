//
//  Generated code. Do not modify.
//  source: authentication/authentication.proto
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

import 'authentication.pb.dart' as $0;

export 'authentication.pb.dart';

@$pb.GrpcServiceName('authentication.Authentication')
class AuthenticationClient extends $grpc.Client {
  static final _$signUp = $grpc.ClientMethod<$0.SignUpInput, $0.SignUpOutput>(
      '/authentication.Authentication/SignUp',
      ($0.SignUpInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SignUpOutput.fromBuffer(value));
  static final _$signIn = $grpc.ClientMethod<$0.SignInInput, $0.SignInOutput>(
      '/authentication.Authentication/SignIn',
      ($0.SignInInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SignInOutput.fromBuffer(value));
  static final _$signOut = $grpc.ClientMethod<$0.SignOutInput, $0.SignOutOutput>(
      '/authentication.Authentication/SignOut',
      ($0.SignOutInput value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SignOutOutput.fromBuffer(value));

  AuthenticationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.SignUpOutput> signUp($0.SignUpInput request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignInOutput> signIn($0.SignInInput request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignOutOutput> signOut($0.SignOutInput request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signOut, request, options: options);
  }
}

@$pb.GrpcServiceName('authentication.Authentication')
abstract class AuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'authentication.Authentication';

  AuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignUpInput, $0.SignUpOutput>(
        'SignUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignUpInput.fromBuffer(value),
        ($0.SignUpOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignInInput, $0.SignInOutput>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignInInput.fromBuffer(value),
        ($0.SignInOutput value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignOutInput, $0.SignOutOutput>(
        'SignOut',
        signOut_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignOutInput.fromBuffer(value),
        ($0.SignOutOutput value) => value.writeToBuffer()));
  }

  $async.Future<$0.SignUpOutput> signUp_Pre($grpc.ServiceCall call, $async.Future<$0.SignUpInput> request) async {
    return signUp(call, await request);
  }

  $async.Future<$0.SignInOutput> signIn_Pre($grpc.ServiceCall call, $async.Future<$0.SignInInput> request) async {
    return signIn(call, await request);
  }

  $async.Future<$0.SignOutOutput> signOut_Pre($grpc.ServiceCall call, $async.Future<$0.SignOutInput> request) async {
    return signOut(call, await request);
  }

  $async.Future<$0.SignUpOutput> signUp($grpc.ServiceCall call, $0.SignUpInput request);
  $async.Future<$0.SignInOutput> signIn($grpc.ServiceCall call, $0.SignInInput request);
  $async.Future<$0.SignOutOutput> signOut($grpc.ServiceCall call, $0.SignOutInput request);
}
