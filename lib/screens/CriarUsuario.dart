import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;

class CriarUsuario extends StatefulWidget {
  @override
  _CriarUsuarioState createState() => _CriarUsuarioState();
}

class _CriarUsuarioState extends State<CriarUsuario> {
  bool _showPassword = false;

  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();

  _criarUsuario() async {
    if (_controllerSenha.text != "" &&
        _controllerSenha.text != "" &&
        _controllerEmail.text != "") {
      await globals.auth
          .createUserWithEmailAndPassword(
        email: _controllerLogin.text,
        password: _controllerSenha.text,
      )
          .then((firebaseUser) async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Criação de usuario"),
                content: Text(
                    "O usuário com E-mail ${firebaseUser.email} foi criado com sucesso"),
                actions: [
                  FlatButton(
                      onPressed: () async {
                        await globals.auth.signOut();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text("OK"))
                ],
              );
            });
      }).catchError((erro) {
        print(" erro ao logar : " + erro.toString());
      });
    } else {
      print("E-mail, senha ou nome está vazio");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD2D2D2),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Image.asset("assets/imagens/logo.png")),
              Padding(
                padding: EdgeInsets.only(top: 75),
                child: Text(globals.criarUsuario),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.blue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(5)),
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Nome",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blue,
                            decorationColor: Colors.white,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decorationColor: Colors.blue,
                        ),
                        controller: _controllerEmail,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blue,
                            decorationColor: Colors.white,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decorationColor: Colors.blue,
                        ),
                        controller: _controllerLogin,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextField(
                        obscureText: _showPassword == false ? true : false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _showPassword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            ),
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blue,
                            decorationColor: Colors.white,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        controller: _controllerSenha,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: GestureDetector(
                    onTap: _criarUsuario,
                    child: Image.asset("assets/imagens/flecha.png"),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: Text(globals.version)),
            ],
          ),
        ),
      ),
    );
  }
}
