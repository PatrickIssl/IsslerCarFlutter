import 'dart:convert';

import 'package:http/http.dart' as http;
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
      var corpo = json.encode({
        "id": null,
        "email": _controllerEmail.text,
        "senha": _controllerSenha.text
      });
      try {
        http.Response response = await http.post(
            globals.url + "usuario/salvar",
            headers: {"Content-type": "application/json; charset=UTF-8"},
            body: corpo);
        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Usuario cadastrado com sucesso'),
            backgroundColor: Colors.green,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: <Widget>[
                Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text("Erro ao cadastrar usuario")
              ],
            ),
            backgroundColor: Colors.red,
          ));
        }
      } on Exception catch (_) {
        print("Erro");
      }
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
