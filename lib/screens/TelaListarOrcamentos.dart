import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;

class TelaListarOrcamentos extends StatefulWidget {
  @override
  _TelaListarOrcamentosState createState() => _TelaListarOrcamentosState();
}

class _TelaListarOrcamentosState extends State<TelaListarOrcamentos> {

  List _itens = [];

  void _carregarItens() async{

    globals.db.collection("orcamentos").snapshots().listen((snapshot) {
      for(DocumentSnapshot item in snapshot.documents){
        _itens.add(item.data);
      }
    });
    setState(() {
      print("ola");
    });

  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){
              return ListTile(
                title: Text( _itens[indice]["modelo"]),
                subtitle: Text(_itens[indice]["nome_do_cliente"]),
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(_itens[indice]["modelo"]),
                          titlePadding: EdgeInsets.all(25),
                          titleTextStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.orange
                          ),
                          content: Text(_itens[indice]["placa"]),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: (){
                                  print("Selecionado sim");
                                  Navigator.pop(context);
                                },
                                child: Text("Sim")
                            ),
                            FlatButton(
                                onPressed: (){
                                  print("Selecionado não");
                                  Navigator.pop(context);
                                },
                                child: Text("não")
                            ),
                          ],
                          contentPadding: EdgeInsets.all(20),
                        );
                      }
                  );
                },
              );
            }
        ),
      ),
    );
  }
}