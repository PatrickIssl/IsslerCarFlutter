import 'dart:async';
import 'package:flutter/material.dart';
import 'package:isslercar/gradients/GradientText.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isslercar/screens/Login.dart';
import 'package:isslercar/screens/TelaPrincipal.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  _pegarUsuario() async{
    globals.usuarioAtual = await globals.auth.currentUser();
  }

  Timer _timer;
  int _start = 2;
  int _enviou = 0;
  void startTimer() {
    _pegarUsuario();
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) async {
        if (_start == 0) {
          _start == 2;
          timer.cancel();
          if(globals.usuarioAtual != null){
            if(globals.entrou == 0 ){
              globals.entrou = 1;
              await Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TelaPrincipal()),);
            }
          }else{
            if(globals.entrou == 0){
              globals.entrou = 1;
              await Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Login()),);
            }
          }
        } else {
          _start--;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    globals.entrou = 0;
    startTimer();
    return GestureDetector(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: globals.colorsFundo,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 200)),
              GradientText(globals.titulo,
                gradient: LinearGradient(
                  colors: globals.colorTitulo,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              GradientText(globals.subtitulo,
                gradient: LinearGradient(
                  colors: globals.colorTitulo,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 60)),
              SpinKitFadingCircle(
                color: Colors.black38,
                size: 100.0,
              ),
              Padding(padding: EdgeInsets.only(top: 125)),
              Text(
                globals.version,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      onTap:(){globals.entrou =0; startTimer();},
    );
  }
}