/**
 * @fileoverview gRPC-Web generated client stub for todo
 * @enhanceable
 * @public
 */

// GENERATED CODE -- DO NOT EDIT!


/* eslint-disable */
// @ts-nocheck


import * as grpcWeb from 'grpc-web';

import * as todo_todo_pb from '../todo/todo_pb';


export class TodoRpcClient {
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

  methodInfoList = new grpcWeb.AbstractClientBase.MethodInfo(
    todo_todo_pb.ListOutput,
    (request: todo_todo_pb.ListInput) => {
      return request.serializeBinary();
    },
    todo_todo_pb.ListOutput.deserializeBinary
  );

  list(
    request: todo_todo_pb.ListInput,
    metadata: grpcWeb.Metadata | null): Promise<todo_todo_pb.ListOutput>;

  list(
    request: todo_todo_pb.ListInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: todo_todo_pb.ListOutput) => void): grpcWeb.ClientReadableStream<todo_todo_pb.ListOutput>;

  list(
    request: todo_todo_pb.ListInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: todo_todo_pb.ListOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/todo.TodoRpc/List',
        request,
        metadata || {},
        this.methodInfoList,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/todo.TodoRpc/List',
    request,
    metadata || {},
    this.methodInfoList);
  }

  methodInfoGet = new grpcWeb.AbstractClientBase.MethodInfo(
    todo_todo_pb.GetOutput,
    (request: todo_todo_pb.GetInput) => {
      return request.serializeBinary();
    },
    todo_todo_pb.GetOutput.deserializeBinary
  );

  get(
    request: todo_todo_pb.GetInput,
    metadata: grpcWeb.Metadata | null): Promise<todo_todo_pb.GetOutput>;

  get(
    request: todo_todo_pb.GetInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: todo_todo_pb.GetOutput) => void): grpcWeb.ClientReadableStream<todo_todo_pb.GetOutput>;

  get(
    request: todo_todo_pb.GetInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: todo_todo_pb.GetOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/todo.TodoRpc/Get',
        request,
        metadata || {},
        this.methodInfoGet,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/todo.TodoRpc/Get',
    request,
    metadata || {},
    this.methodInfoGet);
  }

  methodInfoCreate = new grpcWeb.AbstractClientBase.MethodInfo(
    todo_todo_pb.CreateOutput,
    (request: todo_todo_pb.CreateInput) => {
      return request.serializeBinary();
    },
    todo_todo_pb.CreateOutput.deserializeBinary
  );

  create(
    request: todo_todo_pb.CreateInput,
    metadata: grpcWeb.Metadata | null): Promise<todo_todo_pb.CreateOutput>;

  create(
    request: todo_todo_pb.CreateInput,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: todo_todo_pb.CreateOutput) => void): grpcWeb.ClientReadableStream<todo_todo_pb.CreateOutput>;

  create(
    request: todo_todo_pb.CreateInput,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: todo_todo_pb.CreateOutput) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/todo.TodoRpc/Create',
        request,
        metadata || {},
        this.methodInfoCreate,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/todo.TodoRpc/Create',
    request,
    metadata || {},
    this.methodInfoCreate);
  }

}

