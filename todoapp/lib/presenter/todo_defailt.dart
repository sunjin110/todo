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

  String? _title;
  String? _description;

  bool? isUpdated;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: todo,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return _page(context, null);
          case ConnectionState.waiting:
            return _page(context, null);
          case ConnectionState.active:
            return _page(context, null);
          case ConnectionState.done:
            if (snapshot.data == null) {
              return _page(context, null);
            }
            return _page(context, snapshot.data);
        }
      },
    );
  }

  final _editTitleFieldController = TextEditingController();
  final _editDescFieldController = TextEditingController();

  Widget _page(BuildContext context, Todo? todoData) {
    if (todoData != null) {
      _editTitleFieldController.text = todoData.title;
      _editDescFieldController.text = todoData.description;
    }

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("リスト詳細"),
          ),
          body: Container(
            padding: EdgeInsets.all(64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _editTitleFieldController,
                  decoration: const InputDecoration(labelText: "title"),
                  onChanged: (value) => _title = value,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _editDescFieldController,
                  decoration: const InputDecoration(labelText: "description"),
                  onChanged: (value) => _description = value,
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () async {
                      try {
                        await widget.todoUseCase.update(
                            widget.id, DateTime.now(), _title, _description);

                        isUpdated = true;
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text("更新"),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(isUpdated);
                    },
                    child: const Text("戻る"),
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () {
          Navigator.of(context).pop(isUpdated);
          return Future.value(false);
        });
  }
}