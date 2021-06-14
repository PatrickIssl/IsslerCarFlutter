
import 'package:isslercar/entity/Pecas.dart';

class Orcamento{

  int _id;

  String _ano;

  String _cor_do_veiculo;

  String _data_de_entrada;

  String _endereco_do_cliente;

  String _modelo;

  String _motor;

  String _nome_do_cliente;

  String _numero_do_cliente;

  String _placa;

   String _status;

   List<Pecas> _pecas;

   double _valor_total;


  Orcamento(
      this._id,
      this._ano,
      this._cor_do_veiculo,
      this._data_de_entrada,
      this._endereco_do_cliente,
      this._modelo,
      this._motor,
      this._nome_do_cliente,
      this._numero_do_cliente,
      this._placa,
      this._status,
      this._pecas,
      this._valor_total);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  double get valor_total => _valor_total;

  set valor_total(double value) {
    _valor_total = value;
  }

  List<Pecas> get pecas => _pecas;

  set pecas(List<Pecas> value) {
    _pecas = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get placa => _placa;

  set placa(String value) {
    _placa = value;
  }

  String get numero_do_cliente => _numero_do_cliente;

  set numero_do_cliente(String value) {
    _numero_do_cliente = value;
  }

  String get nome_do_cliente => _nome_do_cliente;

  set nome_do_cliente(String value) {
    _nome_do_cliente = value;
  }

  String get motor => _motor;

  set motor(String value) {
    _motor = value;
  }

  String get modelo => _modelo;

  set modelo(String value) {
    _modelo = value;
  }

  String get endereco_do_cliente => _endereco_do_cliente;

  set endereco_do_cliente(String value) {
    _endereco_do_cliente = value;
  }

  String get data_de_entrada => _data_de_entrada;

  set data_de_entrada(String value) {
    _data_de_entrada = value;
  }

  String get cor_do_veiculo => _cor_do_veiculo;

  set cor_do_veiculo(String value) {
    _cor_do_veiculo = value;
  }

  String get ano => _ano;

  set ano(String value) {
    _ano = value;
  }
}
