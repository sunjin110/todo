import 'package:flutter/material.dart';
import 'package:todoapp/application/todo.dart';
import 'package:todoapp/domain/model/todo.dart';
import 'package:todoapp/presenter/todo_add.dart';
import 'package:todoapp/presenter/todo_defailt.dart';

class TodoListPage extends StatefulWidget {
  final TodoUseCase todoUseCase;

  TodoListPage(this.todoUseCase);

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
    return await widget.todoUseCase.list(DateTime.now(), 0, 100);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: todoListData,
        builder: (context, snapshot) {
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
            final todo = todoList[index];
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
                          widget.todoUseCase, todoList[index].id);
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
                onChanged: (value) {
                  print("value $value が渡されました。TODO done or draft");
                },
                value: true, // todo flags
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final bool? isAdded = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TodoAddPage(widget.todoUseCase);
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
