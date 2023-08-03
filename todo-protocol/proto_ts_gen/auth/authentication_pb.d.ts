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
  getSession(): Session | undefined;
  setSession(value?: Session): SignUpOutput;
  hasSession(): boolean;
  clearSession(): SignUpOutput;

  getStatus(): UserSignUpStatus;
  setStatus(value: UserSignUpStatus): SignUpOutput;

  getSessionCase(): SignUpOutput.SessionCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SignUpOutput.AsObject;
  static toObject(includeInstance: boolean, msg: SignUpOutput): SignUpOutput.AsObject;
  static serializeBinaryToWriter(message: SignUpOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SignUpOutput;
  static deserializeBinaryFromReader(message: SignUpOutput, reader: jspb.BinaryReader): SignUpOutput;
}

export namespace SignUpOutput {
  export type AsObject = {
    session?: Session.AsObject,
    status: UserSignUpStatus,
  }

  export enum SessionCase { 
    _SESSION_NOT_SET = 0,
    SESSION = 1,
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
  getSession(): Session | undefined;
  setSession(value?: Session): SignInOutput;
  hasSession(): boolean;
  clearSession(): SignInOutput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SignInOutput.AsObject;
  static toObject(includeInstance: boolean, msg: SignInOutput): SignInOutput.AsObject;
  static serializeBinaryToWriter(message: SignInOutput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SignInOutput;
  static deserializeBinaryFromReader(message: SignInOutput, reader: jspb.BinaryReader): SignInOutput;
}

export namespace SignInOutput {
  export type AsObject = {
    session?: Session.AsObject,
  }
}

export class SignOutInput extends jspb.Message {
  getSession(): Session | undefined;
  setSession(value?: Session): SignOutInput;
  hasSession(): boolean;
  clearSession(): SignOutInput;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SignOutInput.AsObject;
  static toObject(includeInstance: boolean, msg: SignOutInput): SignOutInput.AsObject;
  static serializeBinaryToWriter(message: SignOutInput, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SignOutInput;
  static deserializeBinaryFromReader(message: SignOutInput, reader: jspb.BinaryReader): SignOutInput;
}

export namespace SignOutInput {
  export type AsObject = {
    session?: Session.AsObject,
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

export class Session extends jspb.Message {
  getSession(): string;
  setSession(value: string): Session;

  getExpireTime(): google_protobuf_timestamp_pb.Timestamp | undefined;
  setExpireTime(value?: google_protobuf_timestamp_pb.Timestamp): Session;
  hasExpireTime(): boolean;
  clearExpireTime(): Session;

  getExpireTimeCase(): Session.ExpireTimeCase;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): Session.AsObject;
  static toObject(includeInstance: boolean, msg: Session): Session.AsObject;
  static serializeBinaryToWriter(message: Session, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): Session;
  static deserializeBinaryFromReader(message: Session, reader: jspb.BinaryReader): Session;
}

export namespace Session {
  export type AsObject = {
    session: string,
    expireTime?: google_protobuf_timestamp_pb.Timestamp.AsObject,
  }

  export enum ExpireTimeCase { 
    _EXPIRE_TIME_NOT_SET = 0,
    EXPIRE_TIME = 2,
  }
}

export enum UserSignUpStatus { 
  SIGNUPSIGNUPSTATUSUNKNOWN = 0,
  SIGNUPSIGNUPSTATUSALLOWED = 1,
  SIGNUPSIGNUPSTATUSWAITFORALLOW = 2,
  SIGNUPSIGNUPSTATUSDENIED = 3,
}
