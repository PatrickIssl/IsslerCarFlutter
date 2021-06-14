
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isslercar/entity/Orcamento.dart';
import 'package:isslercar/screens/TelaConfirmarOrcamento.dart';
import 'package:isslercar/screens/TelaEditarOrcamentos.dart';
import 'package:isslercar/screens/TelaFinalizarServico.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;

class TelaListarOrcamentosConcluidos extends StatefulWidget {
  const TelaListarOrcamentosConcluidos({Key key}) : super(key: key);

  @override
  _TelaListarOrcamentosConcluidosState createState() => _TelaListarOrcamentosConcluidosState();
}

Future<List<Orcamento>> recuperarOrcamentos() async {
  http.Response response = await http.get(
      "${globals.url}buscar/status/confirmado",
      headers: globals.headerComum);

  var dadosJson = json.decode(response.body);

  List<Orcamento> orcamentos = List();
  for (var orcamento in dadosJson) {
    Orcamento p = Orcamento(
        orcamento["id"],
        orcamento["ano"].toString(),
        orcamento["cor_do_veiculo"].toString(),
        orcamento["data_de_entrada"].toString(),
        orcamento["endereco_do_cliente"].toString(),
        orcamento["modelo"].toString(),
        orcamento["motor"]["id"].toString(),
        orcamento["nome_do_cliente"].toString(),
        orcamento["numero_do_cliente"].toString(),
        orcamento["placa"].toString(),
        orcamento["status"].toString(),
        orcamento["pecas"],
        orcamento["valor_total"]);
    orcamentos.add(p);
  }
  return orcamentos;
}

class _TelaListarOrcamentosConcluidosState extends State<TelaListarOrcamentosConcluidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Selecione o serviço desejado"),
          ],
        ),

      ),

      body: FutureBuilder<List<Orcamento>>(
        future: recuperarOrcamentos(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text("lista: Erro ao carregar ");
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List<Orcamento> lista = snapshot.data;
                      Orcamento orcamento = lista[index];

                      return ListTile(
                        onTap: () {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Dados Selecionados para visualizar serviço :"),
                                  titlePadding: EdgeInsets.all(25),
                                  titleTextStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.orange
                                  ),
                                  content: Text("Cliente: ${orcamento.nome_do_cliente} | Carro: ${orcamento.modelo} | Placa ${orcamento.placa}"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text("Correto")
                                    ),
                                    FlatButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text("Errado")
                                    ),
                                  ],
                                  contentPadding: EdgeInsets.all(20),
                                );
                              });
                        },
                        contentPadding: EdgeInsets.only(left: 25),
                        title: Text(orcamento.modelo),
                        subtitle: Text("cor: ${orcamento.cor_do_veiculo}, placa: ${orcamento.placa}"),
                      );
                    });
              }
              break;
          }
        },
      ),


        // StreamBuilder(
        // stream: Firestore.instance.collection('orcamentos confirmados').where('status', isEqualTo: "confirmado").snapshots(),
        // builder: (BuildContext context, AsyncSnapshot snapshot){
        //
        //   if(snapshot.hasError){
        //     return Text('Error: ${snapshot.error}');
        //   }
        //
        //   switch(snapshot.connectionState){
        //     case ConnectionState.waiting:
        //       return LinearProgressIndicator();
        //       break;
        //     default:
        //       return Center(
        //         child: ListView(
        //           children: snapshot.data.documents.map<Widget>((DocumentSnapshot doc){
        //             return ListTile(
        //               leading:  Icon(Icons.book, size: 52,),
        //               title: Text("Cliente: ${doc.data['nome_do_cliente']} | Número : ${doc.data['numero_do_cliente']}"),
        //               subtitle: Text("Carro: ${doc.data['modelo']} | placa : ${doc.data['placa']} | Cor: ${doc.data['cor_do_veiculo']}"),
        //               onTap: (){
        //                 showDialog(context: context, builder: (context){
        //                   return AlertDialog(
        //                     title: Text("Dados Selecionados para visualizar serviço :"),
        //                     titlePadding: EdgeInsets.all(25),
        //                     titleTextStyle: TextStyle(
        //                         fontSize: 20,
        //                         color: Colors.orange
        //                     ),
        //                     content: Text("Cliente: ${doc.data['nome_do_cliente']} | Carro: ${doc.data['modelo']} | Placa ${doc.data['placa']}"),
        //                     actions: <Widget>[
        //                       FlatButton(
        //                           onPressed: (){
        //                             Navigator.pop(context);
        //                             Navigator.push(context,MaterialPageRoute(builder: (context) => TelaFinalizarServico(doc)),);
        //                           },
        //                           child: Text("Correto")
        //                       ),
        //                       FlatButton(
        //                           onPressed: (){
        //                             Navigator.pop(context);
        //                           },
        //                           child: Text("Errado")
        //                       ),
        //                     ],
        //                     contentPadding: EdgeInsets.all(20),
        //                   );
        //                 });
        //               },
        //             );
        //           }).toList(),
        //         ),
        //       );
        //   }
        // },
    );
  }
}

