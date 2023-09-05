/**
 * @fileoverview gRPC-Web generated client stub for authentication
 * @enhanceable
 * @public
 */

// GENERATED CODE -- DO NOT EDIT!


/* eslint-disable */
// @ts-nocheck


import * as grpcWeb from 'grpc-web';

import * as authentication_authentication_pb from '../authentication/authentication_pb';


export class AuthenticationClient {
  client_: grpcWeb.AbstractClientBase;
  hostname_: string;
  credentials_: null | { [index: string]: string; };
  options_: null | { [index: string]: any; };

  constructor (hostname: string,
               credentials?: null | { [index: string]: string; },
               options?: null | { [index: string]: any; }) {
    if (!options) options = {};
    if (!credentials) credentials = {};
    options['format'] = 'binary';

    this.client_ = new grpcWeb.GrpcWebClientBase(options);
    this.hostname_ = hostname;
    this.credentials_ = credentials;
    this.options_ = options;
  }

  methodInfoSignUp = new grpcWeb.AbstractClientBase.MethodInfo(
    authentication_authentication_pb.SignUpOutput,
    (request: authentication_authentication_pb.SignUpInput) => {
      return request.serializeBinary();
    },
    authentication_authentication_pb.SignUpOutput.deserializeBinary
  );

  signUp(
    request: authentication_authentication_pb.SignUpInput,
    metadata: grpcWeb.Metadata | null): Promise<authentication_authentication_pb.SignUpOutput>;

  signUp(
    request: authentication_authentication_pb.SignUpInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: authentication_authentication_pb.SignUpOutput) => void): grpcWeb.ClientReadableStream<authentication_authentication_pb.SignUpOutput>;

  signUp(
    request: authentication_authentication_pb.SignUpInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: authentication_authentication_pb.SignUpOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/authentication.Authentication/SignUp',
        request,
        metadata || {},
        this.methodInfoSignUp,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/authentication.Authentication/SignUp',
    request,
    metadata || {},
    this.methodInfoSignUp);
  }

  methodInfoSignIn = new grpcWeb.AbstractClientBase.MethodInfo(
    authentication_authentication_pb.SignInOutput,
    (request: authentication_authentication_pb.SignInInput) => {
      return request.serializeBinary();
    },
    authentication_authentication_pb.SignInOutput.deserializeBinary
  );

  signIn(
    request: authentication_authentication_pb.SignInInput,
    metadata: grpcWeb.Metadata | null): Promise<authentication_authentication_pb.SignInOutput>;

  signIn(
    request: authentication_authentication_pb.SignInInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: authentication_authentication_pb.SignInOutput) => void): grpcWeb.ClientReadableStream<authentication_authentication_pb.SignInOutput>;

  signIn(
    request: authentication_authentication_pb.SignInInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: authentication_authentication_pb.SignInOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/authentication.Authentication/SignIn',
        request,
        metadata || {},
        this.methodInfoSignIn,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/authentication.Authentication/SignIn',
    request,
    metadata || {},
    this.methodInfoSignIn);
  }

  methodInfoSignOut = new grpcWeb.AbstractClientBase.MethodInfo(
    authentication_authentication_pb.SignOutOutput,
    (request: authentication_authentication_pb.SignOutInput) => {
      return request.serializeBinary();
    },
    authentication_authentication_pb.SignOutOutput.deserializeBinary
  );

  signOut(
    request: authentication_authentication_pb.SignOutInput,
    metadata: grpcWeb.Metadata | null): Promise<authentication_authentication_pb.SignOutOutput>;

  signOut(
    request: authentication_authentication_pb.SignOutInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: authentication_authentication_pb.SignOutOutput) => void): grpcWeb.ClientReadableStream<authentication_authentication_pb.SignOutOutput>;

  signOut(
    request: authentication_authentication_pb.SignOutInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: authentication_authentication_pb.SignOutOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/authentication.Authentication/SignOut',
        request,
        metadata || {},
        this.methodInfoSignOut,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/authentication.Authentication/SignOut',
    request,
    metadata || {},
    this.methodInfoSignOut);
  }

}

