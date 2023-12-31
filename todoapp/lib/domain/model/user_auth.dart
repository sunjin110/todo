class Session {
  final String session;
  final DateTime expireTime;

  Session({required this.session, required this.expireTime});
}

enum UserSignUpStatus {
  allowed,
  waitForAllow,
  denied,
}
