class LoginEntity{

  String _login;
  String _password;
  String _mfa;

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get login => _login;

  set login(String value) {
    _login = value;
  }

  String get mfa => _mfa;

  set mfa(String value) {
    _mfa = value;
  }
}