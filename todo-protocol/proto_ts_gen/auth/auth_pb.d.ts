import * as jspb from 'google-protobuf'

import * as google_protobuf_timestamp_pb from 'google-protobuf/google/protobuf/timestamp_pb';


export class SignUpInput extends jspb.Message {
  getName(): string;
  setName(value: string): SignUpInput;

  getEmail(): string;
  setEmail(value: string): SignUpInput;

  getPassword(): string;
  setPassword(value: string): SignUpInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SignUpInput.AsObject;
  static toObject(includeInstance: boolean, msg: SignUpInput): SignUpInput.AsObject;
  static serializeBinaryToWriter(message: SignUpInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SignUpInput;
  static deserializeBinaryFromReader(message: SignUpInput, reader: jspb.BinaryReader): SignUpInput;
}

export namespace SignUpInput {
  export type AsObject = {
    name: string,
    email: string,
    password: string,
  }
}

export class SignUpOutput extends jspb.Message {
  getToken(): Token | undefined;
  setToken(value?: Token): SignUpOutput;
  hasToken(): boolean;
  clearToken(): SignUpOutput;

  getStatus(): SignupAuthStatus;
  setStatus(value: SignupAuthStatus): SignUpOutput;

  getTokenCase(): SignUpOutput.TokenCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SignUpOutput.AsObject;
  static toObject(includeInstance: boolean, msg: SignUpOutput): SignUpOutput.AsObject;
  static serializeBinaryToWriter(message: SignUpOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SignUpOutput;
  static deserializeBinaryFromReader(message: SignUpOutput, reader: jspb.BinaryReader): SignUpOutput;
}

export namespace SignUpOutput {
  export type AsObject = {
    token?: Token.AsObject,
    status: SignupAuthStatus,
  }

  export enum TokenCase { 
    _TOKEN_NOT_SET = 0,
    TOKEN = 1,
  }
}

export class SignInInput extends jspb.Message {
  getEmail(): string;
  setEmail(value: string): SignInInput;

  getPassword(): string;
  setPassword(value: string): SignInInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SignInInput.AsObject;
  static toObject(includeInstance: boolean, msg: SignInInput): SignInInput.AsObject;
  static serializeBinaryToWriter(message: SignInInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SignInInput;
  static deserializeBinaryFromReader(message: SignInInput, reader: jspb.BinaryReader): SignInInput;
}

export namespace SignInInput {
  export type AsObject = {
    email: string,
    password: string,
  }
}

export class SignInOutput extends jspb.Message {
  getToken(): Token | undefined;
  setToken(value?: Token): SignInOutput;
  hasToken(): boolean;
  clearToken(): SignInOutput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SignInOutput.AsObject;
  static toObject(includeInstance: boolean, msg: SignInOutput): SignInOutput.AsObject;
  static serializeBinaryToWriter(message: SignInOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SignInOutput;
  static deserializeBinaryFromReader(message: SignInOutput, reader: jspb.BinaryReader): SignInOutput;
}

export namespace SignInOutput {
  export type AsObject = {
    token?: Token.AsObject,
  }
}

export class SignOutInput extends jspb.Message {
  getToken(): Token | undefined;
  setToken(value?: Token): SignOutInput;
  hasToken(): boolean;
  clearToken(): SignOutInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SignOutInput.AsObject;
  static toObject(includeInstance: boolean, msg: SignOutInput): SignOutInput.AsObject;
  static serializeBinaryToWriter(message: SignOutInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SignOutInput;
  static deserializeBinaryFromReader(message: SignOutInput, reader: jspb.BinaryReader): SignOutInput;
}

export namespace SignOutInput {
  export type AsObject = {
    token?: Token.AsObject,
  }
}

export class SignOutOutput extends jspb.Message {
  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SignOutOutput.AsObject;
  static toObject(includeInstance: boolean, msg: SignOutOutput): SignOutOutput.AsObject;
  static serializeBinaryToWriter(message: SignOutOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SignOutOutput;
  static deserializeBinaryFromReader(message: SignOutOutput, reader: jspb.BinaryReader): SignOutOutput;
}

export namespace SignOutOutput {
  export type AsObject = {
  }
}

export class Token extends jspb.Message {
  getAccessToken(): string;
  setAccessToken(value: string): Token;

  getExpireTime(): google_protobuf_timestamp_pb.Timestamp | undefined;
  setExpireTime(value?: google_protobuf_timestamp_pb.Timestamp): Token;
  hasExpireTime(): boolean;
  clearExpireTime(): Token;

  getExpireTimeCase(): Token.ExpireTimeCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): Token.AsObject;
  static toObject(includeInstance: boolean, msg: Token): Token.AsObject;
  static serializeBinaryToWriter(message: Token, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): Token;
  static deserializeBinaryFromReader(message: Token, reader: jspb.BinaryReader): Token;
}

export namespace Token {
  export type AsObject = {
    accessToken: string,
    expireTime?: google_protobuf_timestamp_pb.Timestamp.AsObject,
  }

  export enum ExpireTimeCase { 
    _EXPIRE_TIME_NOT_SET = 0,
    EXPIRE_TIME = 2,
  }
}

export enum SignupAuthStatus { 
  SIGNUPAUTHSTATUSUNKNOWN = 0,
  SIGNUPAUTHSTATUSALLOWED = 1,
  SIGNUPAUTHSTATUSWAITFORPERMISSION = 2,
  SIGNUPAUTHSTATUSALREADYHAVEACCOUNT = 3,
  SIGNUPAUTHSTATUSAUTHDENIIED = 4,
}
