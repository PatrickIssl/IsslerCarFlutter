class Conta{
  int _id;
  String _conta;
  String _senha;
  String _mfa;


  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get conta => _conta;

  set conta(String value) {
    _conta = value;
  }

  String get senha => _senha;

  String get mfa => _mfa;

  set mfa(String value) {
    _mfa = value;
  }

  set senha(String value) {
    _senha = value;
  }

  Conta(this._id, this._conta, this._senha, this._mfa);
}
