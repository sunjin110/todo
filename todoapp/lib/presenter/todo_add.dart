import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:logger/logger.dart';
import 'package:todoapp/application/todo.dart';

class TodoAddPage extends StatefulWidget {
  final TodoUseCase todoUseCase;
  final Logger _logger = Logger();

  TodoAddPage(this.todoUseCase, {super.key});

  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _title = '';
  String _description = '';
  DateTime? _startTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("リスト追加画面"),
      ),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  _title = value;
                });
              },
              decoration: const InputDecoration(labelText: "title"),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _description = value;
                });
              },
              decoration: const InputDecoration(labelText: "description"),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(2023, 1, 1),
                    maxTime: DateTime(2025, 12, 31),
                    onCancel: () {
                      setState(() {
                        _startTime = null;
                      });
                    },
                    onConfirm: (date) {
                      widget._logger.i("on confirm date is $date");
                      setState(() {
                        _startTime = date;
                      });
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.jp,
                  );
                },
                child: _startTime == null
                    ? const Text("開始日時")
                    : Text("開始日時: ${_startTime.toString()}"),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () async {
                  await widget.todoUseCase
                      .add(DateTime.now(), _title, _description, _startTime);

                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  "リスト追加",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black12)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("キャンセル"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
