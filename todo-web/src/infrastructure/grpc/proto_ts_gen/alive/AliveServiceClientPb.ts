/**
 * @fileoverview gRPC-Web generated client stub for alive
 * @enhanceable
 * @public
 */

// GENERATED CODE -- DO NOT EDIT!


/* eslint-disable */
// @ts-nocheck


import * as grpcWeb from 'grpc-web';

import * as common_common_pb from '../common/common_pb';


export class AliveClient {
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

  methodInfoPing = new grpcWeb.AbstractClientBase.MethodInfo(
    common_common_pb.Empty,
    (request: common_common_pb.Empty) => {
      return request.serializeBinary();
    },
    common_common_pb.Empty.deserializeBinary
  );

  ping(
    request: common_common_pb.Empty,
    metadata: grpcWeb.Metadata | null): Promise<common_common_pb.Empty>;

  ping(
    request: common_common_pb.Empty,
    metadata: grpcWeb.Metadata | null,
    callback: (err: grpcWeb.Error,
               response: common_common_pb.Empty) => void): grpcWeb.ClientReadableStream<common_common_pb.Empty>;

  ping(
    request: common_common_pb.Empty,
    metadata: grpcWeb.Metadata | null,
    callback?: (err: grpcWeb.Error,
               response: common_common_pb.Empty) => void) {
    if (callback !== undefined) {
      return this.client_.rpcCall(
        this.hostname_ +
          '/alive.Alive/Ping',
        request,
        metadata || {},
        this.methodInfoPing,
        callback);
    }
    return this.client_.unaryCall(
    this.hostname_ +
      '/alive.Alive/Ping',
    request,
    metadata || {},
    this.methodInfoPing);
  }

}

