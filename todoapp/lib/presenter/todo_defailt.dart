import 'package:flutter/material.dart';
import 'package:todoapp/application/todo.dart';
import 'package:todoapp/domain/model/todo.dart';

class TodoDetailPage extends StatefulWidget {
  final TodoUseCase todoUseCase;
  final TodoId id;

  TodoDetailPage(this.todoUseCase, this.id);

  @override
  _TodoDetailPageState createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  late Future<Todo> todo;

  @override
  void initState() {
    super.initState();
    todo = _getTodo();
  }

  Future<Todo> _getTodo() async {
    return await widget.todoUseCase.get(widget.id, DateTime.now());
  }

  String? _title = "";
  String? _description = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: todo,
      builder: (context, snapshot) {
        // _title = snapshot.data?.title;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return _page(context, null);
          case ConnectionState.waiting:
            return _page(context, null);
          case ConnectionState.active:
            return _page(context, null);
          case ConnectionState.done:
            // if (snapshot.hasData && snapshot.data is Todo) {
            //   Todo todoData = snapshot.data as Todo;
            //   _title = todoData.title;
            //   _description = todoData
            //       .description; // If you want to display the description later.
            // }
            if (snapshot.data == null) {
              return _page(context, null);
            }

            return _page(context, snapshot.data);
        }
      },
    );
  }

  Widget _page(BuildContext context, Todo? todoData) {
    if (todoData == null) {
      print("============== todoはnullだった...");
    } else {
      print("nullじゃない!!!");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("リスト詳細"),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: todoData?.title ?? _title,
              decoration: const InputDecoration(labelText: "title"),
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
