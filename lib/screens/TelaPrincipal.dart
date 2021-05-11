import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:isslercar/main.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;
import 'package:isslercar/screens/Login.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();

}


class _TelaPrincipalState extends State<TelaPrincipal> {

  void _restartApp() async {
    RestartWidget.restartApp(context);
  }

  _deslogar() async{
    globals.auth.signOut();
    _restartApp();
    print("teste");
  }



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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child:Column(
                children: [
                  CircleAvatar(child: Text('${globals.usuarioAtual.email[0].toUpperCase()}', style: TextStyle(fontSize: 50),),
                  minRadius: 50,
                  ),
                  Padding(padding: EdgeInsets.only(top:10)),
                  Text("Usuário: ${globals.usuarioAtual.email}")
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              subtitle: Text("Encerrar Sessão"),
              trailing: Icon(Icons.arrow_forward),
              onTap:_deslogar

            )

          ],
        ),
      )
    );
  }
}
