import 'package:flutter/material.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;

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
            Icon(Icons.account_circle,size: 50,)
          ],
        ),

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFA7A6A6),
              Color(0xFFFFFFFF),
            ],
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
                          colors: [
                            Color(0xFF007BFF),
                            Color(0xA36B8FFF),
                          ],
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
                          colors: [
                            Color(0xFF007BFF),
                            Color(0xA36B8FFF),
                          ],
                        ),
                      ),
                    ),
                      onTap: (){globals.auth.signOut();},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
