import * as jspb from 'google-protobuf'

import * as google_protobuf_timestamp_pb from 'google-protobuf/google/protobuf/timestamp_pb';
import * as user_user_pb from '../user/user_pb';
import * as authentication_authentication_pb from '../authentication/authentication_pb';
import * as list_list_pb from '../list/list_pb';


export class TodoFilter extends jspb.Message {
  getId(): TodoId | undefined;
  setId(value?: TodoId): TodoFilter;
  hasId(): boolean;
  clearId(): TodoFilter;

  getTitle(): string;
  setTitle(value: string): TodoFilter;

  getTitleFilterKind(): list_list_pb.FilterKind;
  setTitleFilterKind(value: list_list_pb.FilterKind): TodoFilter;

  getDescription(): string;
  setDescription(value: string): TodoFilter;

  getDescriptionFilterKind(): list_list_pb.FilterKind;
  setDescriptionFilterKind(value: list_list_pb.FilterKind): TodoFilter;

  getStatus(): Status;
  setStatus(value: Status): TodoFilter;

  getIdCase(): TodoFilter.IdCase;

  getTitleCase(): TodoFilter.TitleCase;

  getTitleFilterKindCase(): TodoFilter.TitleFilterKindCase;

  getDescriptionCase(): TodoFilter.DescriptionCase;

  getDescriptionFilterKindCase(): TodoFilter.DescriptionFilterKindCase;

  getStatusCase(): TodoFilter.StatusCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): TodoFilter.AsObject;
  static toObject(includeInstance: boolean, msg: TodoFilter): TodoFilter.AsObject;
  static serializeBinaryToWriter(message: TodoFilter, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): TodoFilter;
  static deserializeBinaryFromReader(message: TodoFilter, reader: jspb.BinaryReader): TodoFilter;
}

export namespace TodoFilter {
  export type AsObject = {
    id?: TodoId.AsObject,
    title: string,
    titleFilterKind: list_list_pb.FilterKind,
    description: string,
    descriptionFilterKind: list_list_pb.FilterKind,
    status: Status,
  }

  export enum IdCase { 
    _ID_NOT_SET = 0,
    ID = 1,
  }

  export enum TitleCase { 
    _TITLE_NOT_SET = 0,
    TITLE = 2,
  }

  export enum TitleFilterKindCase { 
    _TITLE_FILTER_KIND_NOT_SET = 0,
    TITLE_FILTER_KIND = 3,
  }

  export enum DescriptionCase { 
    _DESCRIPTION_NOT_SET = 0,
    DESCRIPTION = 4,
  }

  export enum DescriptionFilterKindCase { 
    _DESCRIPTION_FILTER_KIND_NOT_SET = 0,
    DESCRIPTION_FILTER_KIND = 5,
  }

  export enum StatusCase { 
    _STATUS_NOT_SET = 0,
    STATUS = 6,
  }
}

export class TodoSort extends jspb.Message {
  getCreateTime(): list_list_pb.SortField | undefined;
  setCreateTime(value?: list_list_pb.SortField): TodoSort;
  hasCreateTime(): boolean;
  clearCreateTime(): TodoSort;

  getDoneTime(): list_list_pb.SortField | undefined;
  setDoneTime(value?: list_list_pb.SortField): TodoSort;
  hasDoneTime(): boolean;
  clearDoneTime(): TodoSort;

  getCreateTimeCase(): TodoSort.CreateTimeCase;

  getDoneTimeCase(): TodoSort.DoneTimeCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): TodoSort.AsObject;
  static toObject(includeInstance: boolean, msg: TodoSort): TodoSort.AsObject;
  static serializeBinaryToWriter(message: TodoSort, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): TodoSort;
  static deserializeBinaryFromReader(message: TodoSort, reader: jspb.BinaryReader): TodoSort;
}

export namespace TodoSort {
  export type AsObject = {
    createTime?: list_list_pb.SortField.AsObject,
    doneTime?: list_list_pb.SortField.AsObject,
  }

  export enum CreateTimeCase { 
    _CREATE_TIME_NOT_SET = 0,
    CREATE_TIME = 1,
  }

  export enum DoneTimeCase { 
    _DONE_TIME_NOT_SET = 0,
    DONE_TIME = 2,
  }
}

export class ListInput extends jspb.Message {
  getSession(): authentication_authentication_pb.Session | undefined;
  setSession(value?: authentication_authentication_pb.Session): ListInput;
  hasSession(): boolean;
  clearSession(): ListInput;

  getPaging(): list_list_pb.Paging | undefined;
  setPaging(value?: list_list_pb.Paging): ListInput;
  hasPaging(): boolean;
  clearPaging(): ListInput;

  getFilter(): TodoFilter | undefined;
  setFilter(value?: TodoFilter): ListInput;
  hasFilter(): boolean;
  clearFilter(): ListInput;

  getSort(): TodoSort | undefined;
  setSort(value?: TodoSort): ListInput;
  hasSort(): boolean;
  clearSort(): ListInput;

  getFilterCase(): ListInput.FilterCase;

  getSortCase(): ListInput.SortCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ListInput.AsObject;
  static toObject(includeInstance: boolean, msg: ListInput): ListInput.AsObject;
  static serializeBinaryToWriter(message: ListInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ListInput;
  static deserializeBinaryFromReader(message: ListInput, reader: jspb.BinaryReader): ListInput;
}

export namespace ListInput {
  export type AsObject = {
    session?: authentication_authentication_pb.Session.AsObject,
    paging?: list_list_pb.Paging.AsObject,
    filter?: TodoFilter.AsObject,
    sort?: TodoSort.AsObject,
  }

  export enum FilterCase { 
    _FILTER_NOT_SET = 0,
    FILTER = 3,
  }

  export enum SortCase { 
    _SORT_NOT_SET = 0,
    SORT = 4,
  }
}

export class ListOutput extends jspb.Message {
  getHasNext(): boolean;
  setHasNext(value: boolean): ListOutput;

  getTodosList(): Array<Todo>;
  setTodosList(value: Array<Todo>): ListOutput;
  clearTodosList(): ListOutput;
  addTodos(value?: Todo, index?: number): Todo;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ListOutput.AsObject;
  static toObject(includeInstance: boolean, msg: ListOutput): ListOutput.AsObject;
  static serializeBinaryToWriter(message: ListOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ListOutput;
  static deserializeBinaryFromReader(message: ListOutput, reader: jspb.BinaryReader): ListOutput;
}

export namespace ListOutput {
  export type AsObject = {
    hasNext: boolean,
    todosList: Array<Todo.AsObject>,
  }
}

export class GetInput extends jspb.Message {
  getSession(): authentication_authentication_pb.Session | undefined;
  setSession(value?: authentication_authentication_pb.Session): GetInput;
  hasSession(): boolean;
  clearSession(): GetInput;

  getId(): TodoId | undefined;
  setId(value?: TodoId): GetInput;
  hasId(): boolean;
  clearId(): GetInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetInput.AsObject;
  static toObject(includeInstance: boolean, msg: GetInput): GetInput.AsObject;
  static serializeBinaryToWriter(message: GetInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetInput;
  static deserializeBinaryFromReader(message: GetInput, reader: jspb.BinaryReader): GetInput;
}

export namespace GetInput {
  export type AsObject = {
    session?: authentication_authentication_pb.Session.AsObject,
    id?: TodoId.AsObject,
  }
}

export class GetOutput extends jspb.Message {
  getTodo(): Todo | undefined;
  setTodo(value?: Todo): GetOutput;
  hasTodo(): boolean;
  clearTodo(): GetOutput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetOutput.AsObject;
  static toObject(includeInstance: boolean, msg: GetOutput): GetOutput.AsObject;
  static serializeBinaryToWriter(message: GetOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetOutput;
  static deserializeBinaryFromReader(message: GetOutput, reader: jspb.BinaryReader): GetOutput;
}

export namespace GetOutput {
  export type AsObject = {
    todo?: Todo.AsObject,
  }
}

export class CreateInput extends jspb.Message {
  getSession(): authentication_authentication_pb.Session | undefined;
  setSession(value?: authentication_authentication_pb.Session): CreateInput;
  hasSession(): boolean;
  clearSession(): CreateInput;

  getTodo(): CreateTodo | undefined;
  setTodo(value?: CreateTodo): CreateInput;
  hasTodo(): boolean;
  clearTodo(): CreateInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateInput.AsObject;
  static toObject(includeInstance: boolean, msg: CreateInput): CreateInput.AsObject;
  static serializeBinaryToWriter(message: CreateInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateInput;
  static deserializeBinaryFromReader(message: CreateInput, reader: jspb.BinaryReader): CreateInput;
}

export namespace CreateInput {
  export type AsObject = {
    session?: authentication_authentication_pb.Session.AsObject,
    todo?: CreateTodo.AsObject,
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

export class UpdateInput extends jspb.Message {
  getSession(): authentication_authentication_pb.Session | undefined;
  setSession(value?: authentication_authentication_pb.Session): UpdateInput;
  hasSession(): boolean;
  clearSession(): UpdateInput;

  getTodo(): UpdateTodo | undefined;
  setTodo(value?: UpdateTodo): UpdateInput;
  hasTodo(): boolean;
  clearTodo(): UpdateInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): UpdateInput.AsObject;
  static toObject(includeInstance: boolean, msg: UpdateInput): UpdateInput.AsObject;
  static serializeBinaryToWriter(message: UpdateInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): UpdateInput;
  static deserializeBinaryFromReader(message: UpdateInput, reader: jspb.BinaryReader): UpdateInput;
}

export namespace UpdateInput {
  export type AsObject = {
    session?: authentication_authentication_pb.Session.AsObject,
    todo?: UpdateTodo.AsObject,
  }
}

export class UpdateOutput extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): UpdateOutput.AsObject;
  static toObject(includeInstance: boolean, msg: UpdateOutput): UpdateOutput.AsObject;
  static serializeBinaryToWriter(message: UpdateOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): UpdateOutput;
  static deserializeBinaryFromReader(message: UpdateOutput, reader: jspb.BinaryReader): UpdateOutput;
}

export namespace UpdateOutput {
  export type AsObject = {
  }
}

export class DeleteInput extends jspb.Message {
  getSession(): authentication_authentication_pb.Session | undefined;
  setSession(value?: authentication_authentication_pb.Session): DeleteInput;
  hasSession(): boolean;
  clearSession(): DeleteInput;

  getId(): TodoId | undefined;
  setId(value?: TodoId): DeleteInput;
  hasId(): boolean;
  clearId(): DeleteInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): DeleteInput.AsObject;
  static toObject(includeInstance: boolean, msg: DeleteInput): DeleteInput.AsObject;
  static serializeBinaryToWriter(message: DeleteInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): DeleteInput;
  static deserializeBinaryFromReader(message: DeleteInput, reader: jspb.BinaryReader): DeleteInput;
}

export namespace DeleteInput {
  export type AsObject = {
    session?: authentication_authentication_pb.Session.AsObject,
    id?: TodoId.AsObject,
  }
}

export class DeleteOutput extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): DeleteOutput.AsObject;
  static toObject(includeInstance: boolean, msg: DeleteOutput): DeleteOutput.AsObject;
  static serializeBinaryToWriter(message: DeleteOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): DeleteOutput;
  static deserializeBinaryFromReader(message: DeleteOutput, reader: jspb.BinaryReader): DeleteOutput;
}

export namespace DeleteOutput {
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

  getStartTime(): google_protobuf_timestamp_pb.Timestamp | undefined;
  setStartTime(value?: google_protobuf_timestamp_pb.Timestamp): CreateTodo;
  hasStartTime(): boolean;
  clearStartTime(): CreateTodo;

  getStartTimeCase(): CreateTodo.StartTimeCase;

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
    startTime?: google_protobuf_timestamp_pb.Timestamp.AsObject,
  }

  export enum StartTimeCase { 
    _START_TIME_NOT_SET = 0,
    START_TIME = 4,
  }
}

export class UpdateTodo extends jspb.Message {
  getId(): TodoId | undefined;
  setId(value?: TodoId): UpdateTodo;
  hasId(): boolean;
  clearId(): UpdateTodo;

  getTitle(): string;
  setTitle(value: string): UpdateTodo;

  getDescription(): string;
  setDescription(value: string): UpdateTodo;

  getStatus(): Status;
  setStatus(value: Status): UpdateTodo;

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
    id?: TodoId.AsObject,
    title: string,
    description: string,
    status: Status,
  }

  export enum TitleCase { 
    _TITLE_NOT_SET = 0,
    TITLE = 2,
  }

  export enum DescriptionCase { 
    _DESCRIPTION_NOT_SET = 0,
    DESCRIPTION = 3,
  }

  export enum StatusCase { 
    _STATUS_NOT_SET = 0,
    STATUS = 4,
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

  getDoneTime(): google_protobuf_timestamp_pb.Timestamp | undefined;
  setDoneTime(value?: google_protobuf_timestamp_pb.Timestamp): Todo;
  hasDoneTime(): boolean;
  clearDoneTime(): Todo;

  getDoneTimeCase(): Todo.DoneTimeCase;

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
    doneTime?: google_protobuf_timestamp_pb.Timestamp.AsObject,
  }

  export enum DoneTimeCase { 
    _DONE_TIME_NOT_SET = 0,
    DONE_TIME = 7,
  }
}

export enum Status { 
  DONE = 0,
  SCHEDULED = 1,
  DRAFT = 2,
}
