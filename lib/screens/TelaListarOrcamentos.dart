import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isslercar/screens/TelaEditarOrcamentos.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;

class TelaListarOrcamentos extends StatefulWidget {
  @override
  _TelaListarOrcamentosState createState() => _TelaListarOrcamentosState();
}

class _TelaListarOrcamentosState extends State<TelaListarOrcamentos> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(

     appBar: AppBar(
       title:Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text("Selecione o carro desejado"),
         ],
       ),

     ),

     body: StreamBuilder(
       stream: Firestore.instance.collection('orcamentos').where('status', isEqualTo: "novo").snapshots(),
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
                     title: Text("Cliente: ${doc.data['nome_do_cliente']} | Número : ${doc.data['numero_do_cliente']}"),
                     subtitle: Text("Carro: ${doc.data['modelo']} | placa : ${doc.data['placa']} | Cor: ${doc.data['cor_do_veiculo']}"),
                     onTap: (){
                       showDialog(context: context, builder: (context){
                         return AlertDialog(
                           title: Text("Dados Selecionados para edição :"),
                           titlePadding: EdgeInsets.all(25),
                           titleTextStyle: TextStyle(
                               fontSize: 20,
                               color: Colors.orange
                           ),
                           content: Text("Cliente: ${doc.data['nome_do_cliente']} | Carro: ${doc.data['modelo']} | Placa ${doc.data['placa']}"),
                           actions: <Widget>[
                             FlatButton(
                                 onPressed: (){
                                   Navigator.pop(context);
                                   Navigator.push(context,MaterialPageRoute(builder: (context) => TelaEditarOrcamentos(doc)),);
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
