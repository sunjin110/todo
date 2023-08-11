import 'dart:ffi';

class Paging {
  final Int32 offset;
  final Int32 limit;
  Paging({required this.offset, required this.limit});
}

class FilterField<T> {
  final T value;
  final FilterKind kind;
  FilterField({required this.value, required this.kind});
}

enum FilterKind {
  partialMatch,
  perfectMatch,
}

class SortField {
  final SortKind sortKind;
  final Int32 priority;
  SortField({required this.sortKind, required this.priority});
}

enum SortKind {
  asc,
  desc,
}
