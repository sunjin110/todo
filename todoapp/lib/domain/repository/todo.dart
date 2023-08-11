import 'package:todoapp/domain/model/todo.dart';
import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/domain/repository/repository.dart';

abstract class TodoRepository {
  Future<ListOutput> list(ListInput input);
  Future<Todo> get(Session session, TodoId id);
  Future<void> create(Session session, CreateTodo todo);
  Future<void> update(Session session, UpdateTodo todo);
  Future<void> delete(Session session, TodoId id);
}

class ListInput {
  final Session session;
  final Paging paging;
  final TodoFilter? filter;
  final TodoSort? sort;

  ListInput(
      {required this.session,
      required this.paging,
      required this.filter,
      required this.sort});
}

class TodoFilter {
  final TodoId? id;
  final FilterField<String>? title;
  final FilterField<String>? description;
  final TodoStatus? status;
  TodoFilter(
      {required this.id,
      required this.title,
      required this.description,
      required this.status});
}

class TodoSort {
  final SortField? createTime;
  final SortField? doneTime;
  TodoSort({required this.createTime, required this.doneTime});
}

class ListOutput {
  final bool hasNext;
  final List<Todo> todos;
  ListOutput({required this.hasNext, required this.todos});
}

class CreateTodo {
  final String title;
  final String description;
  final TodoStatus status;
  CreateTodo(
      {required this.title, required this.description, required this.status});
}

class UpdateTodo {
  final TodoId id;
  final String? title;
  final String? description;
  final TodoStatus? status;
  UpdateTodo(
      {required this.id,
      required this.title,
      required this.description,
      required this.status});
}
