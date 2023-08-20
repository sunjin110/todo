import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/application/authentication.dart';
import 'package:todoapp/application/todo.dart';
import 'package:todoapp/presenter/presenter.dart';
import 'package:todoapp/presenter/todo_list.dart';

class SignIn extends StatefulWidget {
  final AuthenticationUseCaseInterface _authenticationUseCase;
  final TodoUseCase _todoUseCase;
  final ErrorHandler _errorHandling;

  const SignIn(this._authenticationUseCase, this._todoUseCase, this._errorHandling, {super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン画面"),
      ),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "email"),
              onChanged: (value) => email = value,
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "password"),
              onChanged: (value) => password = value,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: () async {
                  await widget._authenticationUseCase
                      .signIn(email, password)
                      .then((value) => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => TodoListPage(
                                  widget._todoUseCase, widget._errorHandling)),
                          (route) => false))
                      .catchError((e) {
                    logger.e("failed sign in",
                        error: e, stackTrace: StackTrace.current);
                    Fluttertoast.showToast(msg: "sign inに失敗しました");
                  });
                },
                child: const Text("SignIn"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
