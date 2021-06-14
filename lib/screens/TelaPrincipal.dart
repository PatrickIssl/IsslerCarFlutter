import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:isslercar/main.dart';
import 'package:isslercar/screens/TelaListarOrcamentos.dart';
import 'package:isslercar/screens/TelaListarOrcamentosConcluidos.dart';
import 'package:isslercar/screens/TelaListarOrcamentosRealizados.dart';
import 'package:isslercar/screens/TelaOrcamentos.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;
import 'package:isslercar/screens/Login.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();

}


class _TelaPrincipalState extends State<TelaPrincipal> {



@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Menu Principal"),
          ],
        ),

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: globals.colorsFundo,
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child:
                    Container(height: 150 , width: 150,
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[
                          Icon(Icons.playlist_add,size: 75,),
                          Text(" Inserir \nValores", style: TextStyle(fontSize: 20, color: Colors.white),)
                        ]
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: globals.gradienteAzul,
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => TelaListarOrcamentos()),);
                    },
                  ),
                  GestureDetector(
                    child:
                    Container(height: 150 , width: 150,
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Icon(Icons.car_repair,size: 75,),
                            Text("Cadastrar \norçamento", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ]
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: globals.gradienteAzul,
                        ),
                      ),
                    ),
                      onTap: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context) => TelaOrcamentos()),);
                      },
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child:
                    Container(height: 150 , width: 150,
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Icon(Icons.list,size: 75,),
                            Text("Orçamentos \n completos", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ]
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: globals.gradienteAzul,
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => TelaListarOrcamentosRealizados()),);
                    },
                  ),
                  GestureDetector(
                    child:
                    Container(height: 150 , width: 150,
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Icon(Icons.check,size: 75,),
                            Text("    Finalizar \natendimento", style: TextStyle(fontSize: 20, color: Colors.white),)
                          ]
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: globals.gradienteAzul,
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => TelaListarOrcamentosConcluidos()),);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      drawer: globals.DrawerComun()
    );
  }
}
