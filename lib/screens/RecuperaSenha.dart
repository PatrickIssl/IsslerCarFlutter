import 'package:flutter/material.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;

class RecuperaSenha extends StatefulWidget {
  @override
  _RecuperaSenhaState createState() => _RecuperaSenhaState();
}

class _RecuperaSenhaState extends State<RecuperaSenha> {
  TextEditingController _controllerLogin = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: globals.colorsFundo,
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
                child: Text(globals.recuperarSenha),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.blue),
                  child: TextField(
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
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: GestureDetector(
                    onTap: (){

                    },
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
