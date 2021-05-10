import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isslercar/screens/Login.dart';
import 'package:isslercar/screens/TelaPrincipal.dart';
import 'variaveis/globals.dart' as globals;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

   globals.usuarioAtual = await globals.auth.currentUser();

  if(globals.usuarioAtual != null){
    print("usuario Logado: "+ globals.usuarioAtual.email);
    runApp(MaterialApp(
        home: TelaPrincipal()
    ));
  }else{
    runApp(MaterialApp(
        home: Login()
    ));
  }
}