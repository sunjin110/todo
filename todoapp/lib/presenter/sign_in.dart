import 'package:flutter/material.dart';
import 'package:todoapp/application/authentication.dart';

class SignIn extends StatefulWidget {
  final AuthenticationUseCaseInterface authenticationUseCase;

  SignIn(this.authenticationUseCase);

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
        title: Text("ログイン画面"),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
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
            Container(
              width: double.infinity,
              child: TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: () async {
                  await widget.authenticationUseCase.signIn(email, password);
                },
                child: Text("SignIn"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
