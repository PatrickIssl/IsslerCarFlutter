class Pecas {

  int _id;

  String _nome;

  String _valor;

  int get id => _id;


  Pecas();

  set id(int value) {
    _id = value;
  }

  String get nome => _nome;

  String get valor => _valor;

  set valor(String value) {
    _valor = value;
  }

  set nome(String value) {
    _nome = value;
  }
}
