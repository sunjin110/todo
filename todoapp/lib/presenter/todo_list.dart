import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:todoapp/application/error.dart';
import 'package:todoapp/application/todo.dart';
import 'package:todoapp/domain/model/todo.dart';
import 'package:todoapp/presenter/dummy.dart';
import 'package:todoapp/presenter/presenter.dart';
import 'package:todoapp/presenter/sign_in.dart';
import 'package:todoapp/presenter/todo_add.dart';
import 'package:todoapp/presenter/todo_defailt.dart';

final logger = Logger();

class TodoListPage extends StatefulWidget {
  final TodoUseCase _todoUseCase;
  final ErrorHandler _errorHandler;
  final Logger logger = Logger();

  TodoListPage(this._todoUseCase, this._errorHandler);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late Future<TodoListOutput> todoListData;

  @override
  void initState() {
    super.initState();
    todoListData = _list();
  }

  Future<TodoListOutput> _list() async {
    return await widget._todoUseCase.list(DateTime.now(), 0, 100);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: todoListData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            logger.d("エラーだったのでlogin画面に遷移させます", error: snapshot.error);
            // setState(() {
            //   _listError = snapshot.error;
            // });

            // _listError = snapshot.error;

            // widget._errorHandler.handling(context, snapshot.error!);
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return SignIn(null);
            // }))
            // widget._errorHandler.handling(context, snapshot.error!);
            // return page(context, []);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget._errorHandler.handling(context, snapshot.error!);
            });
            // return const SizedBox.shrink();
            return page(context, []);
          }

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return page(context, []);
            case ConnectionState.waiting:
              return page(context, []);
            case ConnectionState.active:
              return page(context, []);
            case ConnectionState.done:
              final List<Todo> todoList =
                  snapshot.data != null ? snapshot.data!.list : [];
              return page(context, todoList);
          }
        });
  }

  Widget page(BuildContext context, List<Todo> todoList) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("リスト一覧"),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            var todo = todoList[index];
            return Card(
              child: CheckboxListTile(
                activeColor: Colors.blue,
                title: Text(todo.title),
                subtitle: Text(todo.description),
                secondary: TextButton(
                  onPressed: () async {
                    final bool? isUpdated = await Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TodoDetailPage(
                          widget._todoUseCase, todoList[index].id);
                    }));

                    if (isUpdated == null || !isUpdated) {
                      return;
                    }
                    setState(() {
                      todoListData = _list();
                    });
                  },
                  child: const Text("詳細"),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) async {
                  if (value == null) {
                    return;
                  }

                  final updatedStatus =
                      value ? TodoStatus.done : TodoStatus.scheduled;

                  setState(() {
                    todo.status = updatedStatus;
                  });
                  widget._todoUseCase
                      .update(
                          todo.id, DateTime.now(), null, null, updatedStatus)
                      .then((value) {
                    Fluttertoast.showToast(msg: "statusを変更しました");
                  }).catchError((e) {
                    widget._errorHandler.handling(context, e);
                  });
                },
                value: todo.status == TodoStatus.done,
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final bool? isAdded = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TodoAddPage(widget._todoUseCase);
          }));

          if (isAdded == null || !isAdded) {
            return;
          }

          setState(() {
            todoListData = _list();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
