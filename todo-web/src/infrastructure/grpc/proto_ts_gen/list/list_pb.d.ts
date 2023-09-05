import * as jspb from 'google-protobuf'



export class Paging extends jspb.Message {
  getOffset(): number;
  setOffset(value: number): Paging;

  getLimit(): number;
  setLimit(value: number): Paging;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): Paging.AsObject;
  static toObject(includeInstance: boolean, msg: Paging): Paging.AsObject;
  static serializeBinaryToWriter(message: Paging, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): Paging;
  static deserializeBinaryFromReader(message: Paging, reader: jspb.BinaryReader): Paging;
}

export namespace Paging {
  export type AsObject = {
    offset: number,
    limit: number,
  }
}

export class SortField extends jspb.Message {
  getSortKind(): SortKind;
  setSortKind(value: SortKind): SortField;

  getPriority(): number;
  setPriority(value: number): SortField;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): SortField.AsObject;
  static toObject(includeInstance: boolean, msg: SortField): SortField.AsObject;
  static serializeBinaryToWriter(message: SortField, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): SortField;
  static deserializeBinaryFromReader(message: SortField, reader: jspb.BinaryReader): SortField;
}

export namespace SortField {
  export type AsObject = {
    sortKind: SortKind,
    priority: number,
  }
}

export enum FilterKind { 
  FILTERUNKNOWN = 0,
  FILTERPARTIALMATCH = 1,
  FILTERPERFECTMATCH = 2,
}
export enum SortKind { 
  FILTERASC = 0,
  FILTERDESC = 1,
}
