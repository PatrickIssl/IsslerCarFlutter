import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isslercar/screens/Login.dart';
import 'variaveis/globals.dart' as globals;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseUser usuarioAtual = await globals.auth.currentUser();

  if(usuarioAtual != null){
    print("usuario Logado: "+ usuarioAtual.email);
    runApp(MaterialApp(
        home: Login()
    ));
  }else{
    runApp(MaterialApp(
        home: Login()
    ));
  }
}