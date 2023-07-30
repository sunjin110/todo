import * as jspb from 'google-protobuf'

import * as google_protobuf_timestamp_pb from 'google-protobuf/google/protobuf/timestamp_pb';
import * as user_user_pb from '../user/user_pb';


export class ListInput extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ListInput.AsObject;
  static toObject(includeInstance: boolean, msg: ListInput): ListInput.AsObject;
  static serializeBinaryToWriter(message: ListInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ListInput;
  static deserializeBinaryFromReader(message: ListInput, reader: jspb.BinaryReader): ListInput;
}

export namespace ListInput {
  export type AsObject = {
  }
}

export class ListOutput extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ListOutput.AsObject;
  static toObject(includeInstance: boolean, msg: ListOutput): ListOutput.AsObject;
  static serializeBinaryToWriter(message: ListOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ListOutput;
  static deserializeBinaryFromReader(message: ListOutput, reader: jspb.BinaryReader): ListOutput;
}

export namespace ListOutput {
  export type AsObject = {
  }
}

export class GetInput extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetInput.AsObject;
  static toObject(includeInstance: boolean, msg: GetInput): GetInput.AsObject;
  static serializeBinaryToWriter(message: GetInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetInput;
  static deserializeBinaryFromReader(message: GetInput, reader: jspb.BinaryReader): GetInput;
}

export namespace GetInput {
  export type AsObject = {
  }
}

export class GetOutput extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetOutput.AsObject;
  static toObject(includeInstance: boolean, msg: GetOutput): GetOutput.AsObject;
  static serializeBinaryToWriter(message: GetOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetOutput;
  static deserializeBinaryFromReader(message: GetOutput, reader: jspb.BinaryReader): GetOutput;
}

export namespace GetOutput {
  export type AsObject = {
  }
}

export class CreateInput extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateInput.AsObject;
  static toObject(includeInstance: boolean, msg: CreateInput): CreateInput.AsObject;
  static serializeBinaryToWriter(message: CreateInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateInput;
  static deserializeBinaryFromReader(message: CreateInput, reader: jspb.BinaryReader): CreateInput;
}

export namespace CreateInput {
  export type AsObject = {
  }
}

export class CreateOutput extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateOutput.AsObject;
  static toObject(includeInstance: boolean, msg: CreateOutput): CreateOutput.AsObject;
  static serializeBinaryToWriter(message: CreateOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateOutput;
  static deserializeBinaryFromReader(message: CreateOutput, reader: jspb.BinaryReader): CreateOutput;
}

export namespace CreateOutput {
  export type AsObject = {
  }
}

export class TodoId extends jspb.Message {
  getId(): string;
  setId(value: string): TodoId;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): TodoId.AsObject;
  static toObject(includeInstance: boolean, msg: TodoId): TodoId.AsObject;
  static serializeBinaryToWriter(message: TodoId, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): TodoId;
  static deserializeBinaryFromReader(message: TodoId, reader: jspb.BinaryReader): TodoId;
}

export namespace TodoId {
  export type AsObject = {
    id: string,
  }
}

export class CreateTodo extends jspb.Message {
  getTitle(): string;
  setTitle(value: string): CreateTodo;

  getDescription(): string;
  setDescription(value: string): CreateTodo;

  getStatus(): Status;
  setStatus(value: Status): CreateTodo;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateTodo.AsObject;
  static toObject(includeInstance: boolean, msg: CreateTodo): CreateTodo.AsObject;
  static serializeBinaryToWriter(message: CreateTodo, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateTodo;
  static deserializeBinaryFromReader(message: CreateTodo, reader: jspb.BinaryReader): CreateTodo;
}

export namespace CreateTodo {
  export type AsObject = {
    title: string,
    description: string,
    status: Status,
  }
}

export class UpdateTodo extends jspb.Message {
  getTitle(): string;
  setTitle(value: string): UpdateTodo;

  getDescription(): string;
  setDescription(value: string): UpdateTodo;

  getStatus(): string;
  setStatus(value: string): UpdateTodo;

  getTitleCase(): UpdateTodo.TitleCase;

  getDescriptionCase(): UpdateTodo.DescriptionCase;

  getStatusCase(): UpdateTodo.StatusCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): UpdateTodo.AsObject;
  static toObject(includeInstance: boolean, msg: UpdateTodo): UpdateTodo.AsObject;
  static serializeBinaryToWriter(message: UpdateTodo, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): UpdateTodo;
  static deserializeBinaryFromReader(message: UpdateTodo, reader: jspb.BinaryReader): UpdateTodo;
}

export namespace UpdateTodo {
  export type AsObject = {
    title: string,
    description: string,
    status: string,
  }

  export enum TitleCase { 
    _TITLE_NOT_SET = 0,
    TITLE = 1,
  }

  export enum DescriptionCase { 
    _DESCRIPTION_NOT_SET = 0,
    DESCRIPTION = 2,
  }

  export enum StatusCase { 
    _STATUS_NOT_SET = 0,
    STATUS = 3,
  }
}

export class Todo extends jspb.Message {
  getId(): TodoId | undefined;
  setId(value?: TodoId): Todo;
  hasId(): boolean;
  clearId(): Todo;

  getTitle(): string;
  setTitle(value: string): Todo;

  getDescription(): string;
  setDescription(value: string): Todo;

  getStatus(): Status;
  setStatus(value: Status): Todo;

  getUserId(): user_user_pb.UserId | undefined;
  setUserId(value?: user_user_pb.UserId): Todo;
  hasUserId(): boolean;
  clearUserId(): Todo;

  getCreateTime(): google_protobuf_timestamp_pb.Timestamp | undefined;
  setCreateTime(value?: google_protobuf_timestamp_pb.Timestamp): Todo;
  hasCreateTime(): boolean;
  clearCreateTime(): Todo;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): Todo.AsObject;
  static toObject(includeInstance: boolean, msg: Todo): Todo.AsObject;
  static serializeBinaryToWriter(message: Todo, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): Todo;
  static deserializeBinaryFromReader(message: Todo, reader: jspb.BinaryReader): Todo;
}

export namespace Todo {
  export type AsObject = {
    id?: TodoId.AsObject,
    title: string,
    description: string,
    status: Status,
    userId?: user_user_pb.UserId.AsObject,
    createTime?: google_protobuf_timestamp_pb.Timestamp.AsObject,
  }
}

export enum Status { 
  DONE = 0,
  SCHEDULED = 1,
  DRAFT = 2,
}
