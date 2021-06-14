import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isslercar/entity/Conta.dart';
import 'package:isslercar/variaveis/globals.dart' as variaveis;
import 'package:http/http.dart' as http;

Future<Conta> realizarLogin(context) async {
  http.Response response = await http.get(
      "${variaveis.url}usuario/buscar/${variaveis.login.login}/${variaveis.login.password}",
      headers: variaveis.headerComum);

  if (response.statusCode == 200) {
    var dadosJson = json.decode(response.body);
    Conta conta = Conta(dadosJson["id"], dadosJson["conta"].toString(),
        dadosJson["senha"].toString(), dadosJson["mfa"].toString());
    return conta;
  }
  if (response.statusCode == 400) {
    Conta conta = new Conta(null, null, null, null);
    return conta;
  } else {
    Navigator.pop(context);
  }
}