import 'package:todoapp/infrastructure/grpc/proto_dart_gen/list/list.pb.dart';
import 'package:todoapp/domain/repository/repository.dart' as $repository;

FilterKind convertFilterKind($repository.FilterKind filterKind) {
  switch (filterKind) {
    case $repository.FilterKind.partialMatch:
      return FilterKind.FilterPartialMatch;
    case $repository.FilterKind.perfectMatch:
      return FilterKind.FilterPerfectMatch;
  }
}

Paging convertPaging($repository.Paging paging) {
  final grpcPaging = Paging();
  grpcPaging.limit = paging.limit as int;
  grpcPaging.offset = paging.offset as int;
  return grpcPaging;
}

SortField convertSortField($repository.SortField sortField) {
  final grpcSortField = SortField();
  grpcSortField.sortKind = convertSortKind(sortField.sortKind);
  grpcSortField.priority = sortField.priority as int;
  return grpcSortField;
}

SortKind convertSortKind($repository.SortKind sortKind) {
  switch (sortKind) {
    case $repository.SortKind.asc:
      return SortKind.FilterAsc;
    case $repository.SortKind.desc:
      return SortKind.FilterDesc;
  }
}
