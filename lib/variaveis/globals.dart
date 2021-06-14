library my_prj.globals;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isslercar/entity/Conta.dart';
import 'package:isslercar/entity/Orcamento.dart';
import 'package:isslercar/metodos/LoginEntity.dart';
import 'package:isslercar/screens/Login.dart';


var colorsFundo = [
  Color(0xFFD2D2D2),
  Color(0xFFFFFFFF),
];

var gradienteAzul = [
  Color(0xFF007BFF),
  Color(0xA36B8FFF),
];

var gradienteVermelho = [
  Color(0xFF840404),
  Color(0xFFFF2A2A),
];


//splashScreen
var titulo = "ISSLER";
var subtitulo = "CAR";
var colorTitulo = [
  Color(0xFF007BFF),
  Color(0xA36B8FFF),
  Color(0xFFFFFFFF),
];
var entrou = 0;

//usuario logado
var usuarioAtual;

//versão
var version = "Version 1.0.0 powered by Patrick Issler";

//login

var bemVindo = "Bem-vindos ao sistema de orçamentos da ISSLERCAR.";

//recuperar senha

var recuperarSenha = "Informe o seu E-mail para recuperação de senha";

//criar usuario

var criarUsuario = "Informe os dados do usuário a ser cadastrado";

//
var headerComum = {'Accept': 'application/json; charset=UTF-8'};

var url = "https://localhost:5090/";
LoginEntity login = new LoginEntity();

enviarExcessao(context, text) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Erro"),
          content: Text(text),
          actions: [
            FlatButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      });
}

enviarSucesso(context, text) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Sucesso"),
          content: Text(text),
          actions: [
            FlatButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      });
}

class DrawerComun extends StatefulWidget {
  @override
  _DrawerComunState createState() => _DrawerComunState();
}

class _DrawerComunState extends State<DrawerComun> {
  void _voltarTelaLogin() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  _deslogar() async {
    _voltarTelaLogin();
    print("teste");
  }





  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  child: Text(
                    '${usuarioAtual.email[0].toUpperCase()}',
                    style: TextStyle(fontSize: 50),
                  ),
                  minRadius: 50,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text("Usuário: ${usuarioAtual.email}")
              ],
            ),
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              subtitle: Text("Encerrar Sessão"),
              trailing: Icon(Icons.arrow_forward),
              onTap: _deslogar)
        ],
      ),
    );
  }
}
