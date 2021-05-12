import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;

class TelaListarOrcamentos extends StatefulWidget {
  @override
  _TelaListarOrcamentosState createState() => _TelaListarOrcamentosState();
}

class _TelaListarOrcamentosState extends State<TelaListarOrcamentos> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: StreamBuilder(
       stream: Firestore.instance.collection('orcamentos').snapshots(),
       builder: (BuildContext context, AsyncSnapshot snapshot){

         if(snapshot.hasError){
           return Text('Error: ${snapshot.error}');
         }

         switch(snapshot.connectionState){
           case ConnectionState.waiting:
             return LinearProgressIndicator();
             break;
           default:
             return Center(
               child: ListView(
                 children: snapshot.data.documents.map<Widget>((DocumentSnapshot doc){
                   return ListTile(
                     leading:  Icon(Icons.book, size: 52,),
                     title: Text("Nome do cliente: ${doc.data['nome_do_cliente']} | Número : ${doc.data['numero_do_cliente']}"),
                     subtitle: Text("Carro: ${doc.data['modelo']} | placa : ${doc.data['placa']} | Cor: ${doc.data['cor_do_veiculo']}"),
                   );
                 }).toList(),
               ),
             );
         }
       },
     ),
   );
  }
}
