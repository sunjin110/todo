class Todo {
  final TodoId id;
  final String title;
  final String description;
  final DateTime createTime;
  final DateTime? doneTime;
  final TodoStatus status;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.createTime,
      required this.doneTime,
      required this.status});
}

class TodoId {
  final String id;
  TodoId({required this.id});

  @override
  String toString() {
    return id;
  }
}

enum TodoStatus {
  done,
  scheduled,
  draft,
}
