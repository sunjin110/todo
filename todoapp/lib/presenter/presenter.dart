import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:todoapp/application/authentication.dart';
import 'package:todoapp/application/error.dart';
import 'package:todoapp/presenter/sign_in.dart';

class ErrorHandler {
  static final Logger logger = Logger();
  final AuthenticationUseCase _authenticationUseCase;
  ErrorHandler(this._authenticationUseCase);
  handling(BuildContext context, Object e) {
    logger.e("err. err type is ${e.runtimeType.toString()}",
        time: DateTime.now(), error: e, stackTrace: StackTrace.current);

    if (e is UseCaseException) {
      switch (e.errorCode()) {
        case UseCaseErrorCode.session:
          Fluttertoast.showToast(msg: "セッションエラーです");
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SignIn(_authenticationUseCase);
          }));

        default:
          Fluttertoast.showToast(
              msg: "エラーが発生しました. (とりあえずlogin画面へ) ${e.toString()}");

          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SignIn(_authenticationUseCase);
          }));
          return;
      }
    }
    Fluttertoast.showToast(msg: "予期しないエラーが発生. ${e.toString()}");

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SignIn(_authenticationUseCase);
    }));
  }
}
