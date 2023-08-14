import 'dart:js_interop';

import 'package:todoapp/domain/model/todo.dart';
import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/domain/repository/todo.dart' as $repository;
import 'package:todoapp/infrastructure/grpc/grpc.dart';
import 'package:todoapp/infrastructure/grpc/proto_dart_gen/todo/todo.pbgrpc.dart'
    as $todo;
import 'package:todoapp/infrastructure/repository/authentication.dart';
import 'package:todoapp/infrastructure/repository/repository.dart';

class TodoRepository implements $repository.TodoRepository {
  final $todo.TodoRpcClient client;

  TodoRepository({required this.client});

  static $todo.Status? convertGrpcStatus(TodoStatus? status) {
    if (status == null) {
      return null;
    }
    switch (status) {
      case TodoStatus.done:
        return $todo.Status.done;
      case TodoStatus.draft:
        return $todo.Status.draft;
      case TodoStatus.scheduled:
        return $todo.Status.scheduled;
    }
  }

  static TodoStatus convertModelStatus($todo.Status status) {
    switch (status) {
      case $todo.Status.done:
        return TodoStatus.done;
      case $todo.Status.draft:
        return TodoStatus.draft;
      case $todo.Status.scheduled:
        return TodoStatus.scheduled;
      default:
        return TodoStatus.done;
    }
  }

  static $todo.TodoFilter? convertFilter($repository.TodoFilter? filter) {
    if (filter == null) {
      return null;
    }

    final grpcFilter = $todo.TodoFilter();
    final id = $todo.TodoId();
    id.id = filter.id.toString();

    grpcFilter.id = id;

    if (filter.title != null) {
      grpcFilter.title = filter.title!.value;
      grpcFilter.titleFilterKind = convertFilterKind(filter.title!.kind);
    }

    if (filter.description != null) {
      grpcFilter.description = filter.description!.value;
      grpcFilter.descriptionFilterKind =
          convertFilterKind(filter.description!.kind);
    }

    if (filter.status != null) {
      grpcFilter.status = TodoRepository.convertGrpcStatus(filter.status)!;
    }
    return grpcFilter;
  }

  static $todo.TodoSort convertSort($repository.TodoSort sort) {
    final grpcSort = $todo.TodoSort();
    if (sort.createTime != null) {
      grpcSort.createTime = convertSortField(sort.createTime!);
    }
    if (sort.doneTime != null) {
      grpcSort.doneTime = convertSortField(sort.doneTime!);
    }
    return grpcSort;
  }

  static Todo convertModelTodo($todo.Todo grpcTodo) {
    return Todo(
        id: TodoRepository.convertModelId(grpcTodo.id),
        title: grpcTodo.title,
        status: convertModelStatus(grpcTodo.status),
        doneTime: convertTimestampToDateTime(grpcTodo.doneTime),
        description: grpcTodo.description,
        createTime: convertTimestampToDateTime(grpcTodo.createTime));
  }

  static List<Todo> convertModelTodoList(List<$todo.Todo> grpcTodos) {
    return List.generate(
        grpcTodos.length, (index) => convertModelTodo(grpcTodos[index]));
  }

  static TodoId convertModelId($todo.TodoId id) {
    return TodoId(id: id.id);
  }

  static $todo.TodoId convertGrpcId(TodoId id) {
    final grpcId = $todo.TodoId();
    grpcId.id = id.toString();
    return grpcId;
  }

  static $todo.CreateTodo convertCreateTodo(
      $repository.CreateTodo repoCreateTodo) {
    final createTodo = $todo.CreateTodo();
    createTodo.title = repoCreateTodo.title;
    createTodo.description = repoCreateTodo.description;
    createTodo.status = convertGrpcStatus(repoCreateTodo.status)!;
    return createTodo;
  }

  static $todo.UpdateTodo convertUpdateTodo(
      $repository.UpdateTodo repoUpdateTodo) {
    final updateTodo = $todo.UpdateTodo();
    updateTodo.id = convertGrpcId(repoUpdateTodo.id);

    if (repoUpdateTodo.title != null) {
      updateTodo.title = repoUpdateTodo.title!;
    }

    if (repoUpdateTodo.description != null) {
      updateTodo.description = repoUpdateTodo.description!;
    }

    if (repoUpdateTodo.status != null) {
      updateTodo.status = convertGrpcStatus(repoUpdateTodo.status!)!;
    }

    return updateTodo;
  }

  @override
  Future<$repository.ListOutput> list($repository.ListInput input) async {
    final grpcInput = $todo.ListInput();
    grpcInput.session = convertToGrpcSession(input.session);
    grpcInput.paging = convertPaging(input.paging);
    if (input.filter != null) {
      grpcInput.filter = TodoRepository.convertFilter(input.filter)!;
    }
    if (input.sort != null) {
      grpcInput.sort = TodoRepository.convertSort(input.sort!);
    }
    final res = await client.list(grpcInput);
    return $repository.ListOutput(
        hasNext: res.hasNext, todos: convertModelTodoList(res.todos));
  }

  @override
  Future<void> create(Session session, $repository.CreateTodo todo) async {
    final input = $todo.CreateInput();
    input.session = convertToGrpcSession(session);
    input.todo = convertCreateTodo(todo);
    await client.create(input);
  }

  @override
  Future<void> delete(Session session, TodoId id) async {
    final input = $todo.DeleteInput();
    input.session = convertToGrpcSession(session);
    input.id = convertGrpcId(id);
    await client.delete(input);
  }

  @override
  Future<Todo> get(Session session, TodoId id) async {
    final input = $todo.GetInput();
    input.session = convertToGrpcSession(session);
    input.id = convertGrpcId(id);
    final res = await client.get(input);
    return convertModelTodo(res.todo);
  }

  @override
  Future<void> update(Session session, $repository.UpdateTodo todo) async {
    final input = $todo.UpdateInput();
    input.session = convertToGrpcSession(session);
    input.todo = convertUpdateTodo(todo);
    await client.update(input);
  }
}
