library my_prj.globals;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//metodo auth da autenticação do usuário
FirebaseAuth auth = FirebaseAuth.instance;

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

//tela principal



