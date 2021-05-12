library my_prj.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

//metodo auth da autenticação do usuário
FirebaseAuth auth = FirebaseAuth.instance;

//banco de dados
Firestore db = Firestore.instance;

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
FirebaseUser usuarioAtual;

//versão
var version = "Version 1.0.0 powered by Patrick Issler";

//login

var bemVindo = "Bem-vindos ao sistema de orçamentos da ISSLERCAR.";

//recuperar senha

var recuperarSenha = "Informe o seu E-mail para recuperação de senha";

//criar usuario

var criarUsuario = "Informe os dados do usuário a ser cadastrado";

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
    auth.signOut();
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
