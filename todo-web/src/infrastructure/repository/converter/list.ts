import { FilterKind, Paging, SortField, SortKind } from "../../../domain/repository/list";
import * as grpc from "../../grpc/proto_ts_gen/list/list_pb";


export function toGrpcPaging(paging: Paging): grpc.Paging {
    const grpcPaging = new grpc.Paging();
    grpcPaging.setLimit(paging.limit);
    grpcPaging.setOffset(paging.offset);
    return grpcPaging;
}

export function toGrpcFilterKind(filterKind: FilterKind): grpc.FilterKind {
    switch (filterKind) {
        case FilterKind.Unknown:
            return grpc.FilterKind.FILTERUNKNOWN;
        case FilterKind.PartialMatch:
            return grpc.FilterKind.FILTERPARTIALMATCH;
        case FilterKind.PerfectMatch:
            return grpc.FilterKind.FILTERPERFECTMATCH;
    }
}

export function toGrpcSortField(sortField: SortField): grpc.SortField {
    const grpcSortField = new grpc.SortField();
    grpcSortField.setSortKind(toGrpcSortKind(sortField.sort_kind));
    grpcSortField.setPriority(sortField.priority);
    return grpcSortField;
}

export function toGrpcSortKind(sortKind: SortKind): grpc.SortKind {
    switch (sortKind) {
        case SortKind.Asc:
            return grpc.SortKind.FILTERASC;
        case SortKind.Desc:
            return grpc.SortKind.FILTERDESC;
    }
}