import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:isslercar/main.dart';
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
                          Icon(Icons.people,size: 100,),
                          Text("Usuários", style: TextStyle(fontSize: 20, color: Colors.white),)
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
                    onTap: (){},
                  ),
                  GestureDetector(
                    child:
                    Container(height: 150 , width: 150,
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Icon(Icons.car_repair,size: 100,),
                            Text("Orçamento", style: TextStyle(fontSize: 20, color: Colors.white),)
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
            ],
          ),
        ),
      ),
      drawer: globals.DrawerComun()
    );
  }
}
