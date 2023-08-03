/**
 * @fileoverview gRPC-Web generated client stub for user
 * @enhanceable
 * @public
 */

// GENERATED CODE -- DO NOT EDIT!


/* eslint-disable */
// @ts-nocheck


import * as grpcWeb from 'grpc-web';

import * as user_user_pb from '../user/user_pb';


export class UserRpcClient {
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

  methodInfoCreate = new grpcWeb.AbstractClientBase.MethodInfo(
    user_user_pb.CreateOutput,
    (request: user_user_pb.CreateInput) => {
      return request.serializeBinary();
    },
    user_user_pb.CreateOutput.deserializeBinary
  );

  create(
    request: user_user_pb.CreateInput,
    metadata: grpcWeb.Metadata | null): Promise<user_user_pb.CreateOutput>;

  create(
    request: user_user_pb.CreateInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: user_user_pb.CreateOutput) => void): grpcWeb.ClientReadableStream<user_user_pb.CreateOutput>;

  create(
    request: user_user_pb.CreateInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: user_user_pb.CreateOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/user.UserRpc/Create',
        request,
        metadata || {},
        this.methodInfoCreate,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/user.UserRpc/Create',
    request,
    metadata || {},
    this.methodInfoCreate);
  }

  methodInfoUpdate = new grpcWeb.AbstractClientBase.MethodInfo(
    user_user_pb.UpdateOutput,
    (request: user_user_pb.UpdateInput) => {
      return request.serializeBinary();
    },
    user_user_pb.UpdateOutput.deserializeBinary
  );

  update(
    request: user_user_pb.UpdateInput,
    metadata: grpcWeb.Metadata | null): Promise<user_user_pb.UpdateOutput>;

  update(
    request: user_user_pb.UpdateInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: user_user_pb.UpdateOutput) => void): grpcWeb.ClientReadableStream<user_user_pb.UpdateOutput>;

  update(
    request: user_user_pb.UpdateInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: user_user_pb.UpdateOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/user.UserRpc/Update',
        request,
        metadata || {},
        this.methodInfoUpdate,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/user.UserRpc/Update',
    request,
    metadata || {},
    this.methodInfoUpdate);
  }

  methodInfoDelete = new grpcWeb.AbstractClientBase.MethodInfo(
    user_user_pb.DeleteOutput,
    (request: user_user_pb.DeleteInput) => {
      return request.serializeBinary();
    },
    user_user_pb.DeleteOutput.deserializeBinary
  );

  delete(
    request: user_user_pb.DeleteInput,
    metadata: grpcWeb.Metadata | null): Promise<user_user_pb.DeleteOutput>;

  delete(
    request: user_user_pb.DeleteInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: user_user_pb.DeleteOutput) => void): grpcWeb.ClientReadableStream<user_user_pb.DeleteOutput>;

  delete(
    request: user_user_pb.DeleteInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: user_user_pb.DeleteOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/user.UserRpc/Delete',
        request,
        metadata || {},
        this.methodInfoDelete,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/user.UserRpc/Delete',
    request,
    metadata || {},
    this.methodInfoDelete);
  }

  methodInfoGet = new grpcWeb.AbstractClientBase.MethodInfo(
    user_user_pb.GetOutput,
    (request: user_user_pb.GetInput) => {
      return request.serializeBinary();
    },
    user_user_pb.GetOutput.deserializeBinary
  );

  get(
    request: user_user_pb.GetInput,
    metadata: grpcWeb.Metadata | null): Promise<user_user_pb.GetOutput>;

  get(
    request: user_user_pb.GetInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: user_user_pb.GetOutput) => void): grpcWeb.ClientReadableStream<user_user_pb.GetOutput>;

  get(
    request: user_user_pb.GetInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: user_user_pb.GetOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/user.UserRpc/Get',
        request,
        metadata || {},
        this.methodInfoGet,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/user.UserRpc/Get',
    request,
    metadata || {},
    this.methodInfoGet);
  }

  methodInfoList = new grpcWeb.AbstractClientBase.MethodInfo(
    user_user_pb.ListOutput,
    (request: user_user_pb.ListInput) => {
      return request.serializeBinary();
    },
    user_user_pb.ListOutput.deserializeBinary
  );

  list(
    request: user_user_pb.ListInput,
    metadata: grpcWeb.Metadata | null): Promise<user_user_pb.ListOutput>;

  list(
    request: user_user_pb.ListInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: user_user_pb.ListOutput) => void): grpcWeb.ClientReadableStream<user_user_pb.ListOutput>;

  list(
    request: user_user_pb.ListInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: user_user_pb.ListOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/user.UserRpc/List',
        request,
        metadata || {},
        this.methodInfoList,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/user.UserRpc/List',
    request,
    metadata || {},
    this.methodInfoList);
  }

}

