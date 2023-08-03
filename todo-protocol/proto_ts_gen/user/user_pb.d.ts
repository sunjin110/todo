import * as jspb from 'google-protobuf'

import * as auth_auth_pb from '../auth/auth_pb';
import * as list_list_pb from '../list/list_pb';


export class UserId extends jspb.Message {
  getId(): string;
  setId(value: string): UserId;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): UserId.AsObject;
  static toObject(includeInstance: boolean, msg: UserId): UserId.AsObject;
  static serializeBinaryToWriter(message: UserId, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): UserId;
  static deserializeBinaryFromReader(message: UserId, reader: jspb.BinaryReader): UserId;
}

export namespace UserId {
  export type AsObject = {
    id: string,
  }
}

export class User extends jspb.Message {
  getId(): UserId | undefined;
  setId(value?: UserId): User;
  hasId(): boolean;
  clearId(): User;

  getName(): string;
  setName(value: string): User;

  getEmail(): string;
  setEmail(value: string): User;

  getStatus(): auth_auth_pb.UserSignUpStatus;
  setStatus(value: auth_auth_pb.UserSignUpStatus): User;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): User.AsObject;
  static toObject(includeInstance: boolean, msg: User): User.AsObject;
  static serializeBinaryToWriter(message: User, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): User;
  static deserializeBinaryFromReader(message: User, reader: jspb.BinaryReader): User;
}

export namespace User {
  export type AsObject = {
    id?: UserId.AsObject,
    name: string,
    email: string,
    status: auth_auth_pb.UserSignUpStatus,
  }
}

export class CreateUser extends jspb.Message {
  getName(): string;
  setName(value: string): CreateUser;

  getEmail(): string;
  setEmail(value: string): CreateUser;

  getStatus(): auth_auth_pb.UserSignUpStatus;
  setStatus(value: auth_auth_pb.UserSignUpStatus): CreateUser;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateUser.AsObject;
  static toObject(includeInstance: boolean, msg: CreateUser): CreateUser.AsObject;
  static serializeBinaryToWriter(message: CreateUser, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateUser;
  static deserializeBinaryFromReader(message: CreateUser, reader: jspb.BinaryReader): CreateUser;
}

export namespace CreateUser {
  export type AsObject = {
    name: string,
    email: string,
    status: auth_auth_pb.UserSignUpStatus,
  }
}

export class UpdateUser extends jspb.Message {
  getName(): string;
  setName(value: string): UpdateUser;

  getEmail(): string;
  setEmail(value: string): UpdateUser;

  getStatus(): auth_auth_pb.UserSignUpStatus;
  setStatus(value: auth_auth_pb.UserSignUpStatus): UpdateUser;

  getNameCase(): UpdateUser.NameCase;

  getEmailCase(): UpdateUser.EmailCase;

  getStatusCase(): UpdateUser.StatusCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): UpdateUser.AsObject;
  static toObject(includeInstance: boolean, msg: UpdateUser): UpdateUser.AsObject;
  static serializeBinaryToWriter(message: UpdateUser, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): UpdateUser;
  static deserializeBinaryFromReader(message: UpdateUser, reader: jspb.BinaryReader): UpdateUser;
}

export namespace UpdateUser {
  export type AsObject = {
    name: string,
    email: string,
    status: auth_auth_pb.UserSignUpStatus,
  }

  export enum NameCase { 
    _NAME_NOT_SET = 0,
    NAME = 1,
  }

  export enum EmailCase { 
    _EMAIL_NOT_SET = 0,
    EMAIL = 2,
  }

  export enum StatusCase { 
    _STATUS_NOT_SET = 0,
    STATUS = 3,
  }
}

export class CreateInput extends jspb.Message {
  getSession(): auth_auth_pb.Session | undefined;
  setSession(value?: auth_auth_pb.Session): CreateInput;
  hasSession(): boolean;
  clearSession(): CreateInput;

  getUser(): CreateUser | undefined;
  setUser(value?: CreateUser): CreateInput;
  hasUser(): boolean;
  clearUser(): CreateInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateInput.AsObject;
  static toObject(includeInstance: boolean, msg: CreateInput): CreateInput.AsObject;
  static serializeBinaryToWriter(message: CreateInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateInput;
  static deserializeBinaryFromReader(message: CreateInput, reader: jspb.BinaryReader): CreateInput;
}

export namespace CreateInput {
  export type AsObject = {
    session?: auth_auth_pb.Session.AsObject,
    user?: CreateUser.AsObject,
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
  getSession(): auth_auth_pb.Session | undefined;
  setSession(value?: auth_auth_pb.Session): UpdateInput;
  hasSession(): boolean;
  clearSession(): UpdateInput;

  getUser(): UpdateUser | undefined;
  setUser(value?: UpdateUser): UpdateInput;
  hasUser(): boolean;
  clearUser(): UpdateInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): UpdateInput.AsObject;
  static toObject(includeInstance: boolean, msg: UpdateInput): UpdateInput.AsObject;
  static serializeBinaryToWriter(message: UpdateInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): UpdateInput;
  static deserializeBinaryFromReader(message: UpdateInput, reader: jspb.BinaryReader): UpdateInput;
}

export namespace UpdateInput {
  export type AsObject = {
    session?: auth_auth_pb.Session.AsObject,
    user?: UpdateUser.AsObject,
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
  getSession(): auth_auth_pb.Session | undefined;
  setSession(value?: auth_auth_pb.Session): DeleteInput;
  hasSession(): boolean;
  clearSession(): DeleteInput;

  getId(): UserId | undefined;
  setId(value?: UserId): DeleteInput;
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
    session?: auth_auth_pb.Session.AsObject,
    id?: UserId.AsObject,
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

export class UserFilter extends jspb.Message {
  getId(): UserId | undefined;
  setId(value?: UserId): UserFilter;
  hasId(): boolean;
  clearId(): UserFilter;

  getName(): string;
  setName(value: string): UserFilter;

  getNameFilterKind(): list_list_pb.FilterKind;
  setNameFilterKind(value: list_list_pb.FilterKind): UserFilter;

  getEmail(): string;
  setEmail(value: string): UserFilter;

  getEmailFilterKind(): list_list_pb.FilterKind;
  setEmailFilterKind(value: list_list_pb.FilterKind): UserFilter;

  getIdCase(): UserFilter.IdCase;

  getNameCase(): UserFilter.NameCase;

  getNameFilterKindCase(): UserFilter.NameFilterKindCase;

  getEmailCase(): UserFilter.EmailCase;

  getEmailFilterKindCase(): UserFilter.EmailFilterKindCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): UserFilter.AsObject;
  static toObject(includeInstance: boolean, msg: UserFilter): UserFilter.AsObject;
  static serializeBinaryToWriter(message: UserFilter, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): UserFilter;
  static deserializeBinaryFromReader(message: UserFilter, reader: jspb.BinaryReader): UserFilter;
}

export namespace UserFilter {
  export type AsObject = {
    id?: UserId.AsObject,
    name: string,
    nameFilterKind: list_list_pb.FilterKind,
    email: string,
    emailFilterKind: list_list_pb.FilterKind,
  }

  export enum IdCase { 
    _ID_NOT_SET = 0,
    ID = 1,
  }

  export enum NameCase { 
    _NAME_NOT_SET = 0,
    NAME = 2,
  }

  export enum NameFilterKindCase { 
    _NAME_FILTER_KIND_NOT_SET = 0,
    NAME_FILTER_KIND = 3,
  }

  export enum EmailCase { 
    _EMAIL_NOT_SET = 0,
    EMAIL = 4,
  }

  export enum EmailFilterKindCase { 
    _EMAIL_FILTER_KIND_NOT_SET = 0,
    EMAIL_FILTER_KIND = 5,
  }
}

export class UserSort extends jspb.Message {
  getLastLogin(): list_list_pb.SortField | undefined;
  setLastLogin(value?: list_list_pb.SortField): UserSort;
  hasLastLogin(): boolean;
  clearLastLogin(): UserSort;

  getCreateTime(): list_list_pb.SortField | undefined;
  setCreateTime(value?: list_list_pb.SortField): UserSort;
  hasCreateTime(): boolean;
  clearCreateTime(): UserSort;

  getLastLoginCase(): UserSort.LastLoginCase;

  getCreateTimeCase(): UserSort.CreateTimeCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): UserSort.AsObject;
  static toObject(includeInstance: boolean, msg: UserSort): UserSort.AsObject;
  static serializeBinaryToWriter(message: UserSort, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): UserSort;
  static deserializeBinaryFromReader(message: UserSort, reader: jspb.BinaryReader): UserSort;
}

export namespace UserSort {
  export type AsObject = {
    lastLogin?: list_list_pb.SortField.AsObject,
    createTime?: list_list_pb.SortField.AsObject,
  }

  export enum LastLoginCase { 
    _LAST_LOGIN_NOT_SET = 0,
    LAST_LOGIN = 1,
  }

  export enum CreateTimeCase { 
    _CREATE_TIME_NOT_SET = 0,
    CREATE_TIME = 2,
  }
}

export class ListInput extends jspb.Message {
  getSession(): auth_auth_pb.Session | undefined;
  setSession(value?: auth_auth_pb.Session): ListInput;
  hasSession(): boolean;
  clearSession(): ListInput;

  getPaging(): list_list_pb.Paging | undefined;
  setPaging(value?: list_list_pb.Paging): ListInput;
  hasPaging(): boolean;
  clearPaging(): ListInput;

  getFilter(): UserFilter | undefined;
  setFilter(value?: UserFilter): ListInput;
  hasFilter(): boolean;
  clearFilter(): ListInput;

  getSort(): UserSort | undefined;
  setSort(value?: UserSort): ListInput;
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
    session?: auth_auth_pb.Session.AsObject,
    paging?: list_list_pb.Paging.AsObject,
    filter?: UserFilter.AsObject,
    sort?: UserSort.AsObject,
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

  getUsersList(): Array<User>;
  setUsersList(value: Array<User>): ListOutput;
  clearUsersList(): ListOutput;
  addUsers(value?: User, index?: number): User;

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
    usersList: Array<User.AsObject>,
  }
}

export class GetInput extends jspb.Message {
  getSession(): auth_auth_pb.Session | undefined;
  setSession(value?: auth_auth_pb.Session): GetInput;
  hasSession(): boolean;
  clearSession(): GetInput;

  getId(): UserId | undefined;
  setId(value?: UserId): GetInput;
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
    session?: auth_auth_pb.Session.AsObject,
    id?: UserId.AsObject,
  }
}

export class GetOutput extends jspb.Message {
  getUser(): User | undefined;
  setUser(value?: User): GetOutput;
  hasUser(): boolean;
  clearUser(): GetOutput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetOutput.AsObject;
  static toObject(includeInstance: boolean, msg: GetOutput): GetOutput.AsObject;
  static serializeBinaryToWriter(message: GetOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetOutput;
  static deserializeBinaryFromReader(message: GetOutput, reader: jspb.BinaryReader): GetOutput;
}

export namespace GetOutput {
  export type AsObject = {
    user?: User.AsObject,
  }
}

