import 'package:flutter/material.dart';
import 'package:isslercar/main.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;
import 'package:masked_text/masked_text.dart';


class TelaOrcamentos extends StatefulWidget {
  @override
  _TelaOrcamentosState createState() => _TelaOrcamentosState();
}

class _TelaOrcamentosState extends State<TelaOrcamentos> {

  TextEditingController _carroController = TextEditingController();
  TextEditingController _placaController = TextEditingController();
  TextEditingController _anoController = TextEditingController();
  TextEditingController _pecasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back,
              color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            }),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Orçamentos"),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: globals.colorsFundo,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
           children: <Widget>[

          Padding(padding: EdgeInsets.fromLTRB(50, 10, 50 ,10),
              child: Row(children: [
               Expanded(
                 flex: 3,
                 child:
                 TextField(
                   decoration: InputDecoration(
                       hintText: "Modelo do veículo",
                       labelText: "Modelo",
                       labelStyle: TextStyle(
                           fontSize: 20,
                           color: Colors.blue
                       )
                   ),
                   onSubmitted: (String texto){

                     print("valor digitado:" +  texto);

                   },
                   controller: _carroController,
                 )
               ),
               SizedBox(
                 width: 20,
               ),
               Expanded(
                 flex: 2,
                 child:
                 Padding(
                   padding: EdgeInsets.only(top:20),
                   child: MaskedTextField(
                     mask: "xxxx/xxxx",
                     maxLength: 9,
                     inputDecoration: new InputDecoration(
                         hintText: "Ano Veículo",
                         labelText: "Placa",
                         labelStyle: TextStyle(fontSize: 20,
                             color: Colors.blue)),
                     maskedTextFieldController: _anoController,
                   ),
                 )
               )
             ])
          ),
             Padding(padding: EdgeInsets.fromLTRB(50, 10, 50 ,10),
                 child:
                 MaskedTextField(
                   mask: "xxx-xxxx",
                   maxLength: 8,
                   inputDecoration: new InputDecoration(
                       hintText: "Informe a placa do veículo",
                       labelText: "Placa",
                       labelStyle: TextStyle(fontSize: 20,
                       color: Colors.blue)),
                   maskedTextFieldController: _placaController,
                 )
             ),
             Padding(padding: EdgeInsets.fromLTRB(50, 10, 50 ,10),
                 child:Column(
                   children: <Widget>[
                     Card(
                         child: Padding(
                           padding: EdgeInsets.all(8.0),
                           child: TextField(
                             maxLines: 8,
                             decoration: InputDecoration(
                                  border: InputBorder.none,
                                 labelText: "Peças",
                                 hintText: "Informe as Peças para realizar o orçamento",
                                 labelStyle: TextStyle(fontSize: 20,
                                 color: Colors.blue)),
                             controller: _pecasController,
                           ),
                         )
                     )
                   ],
                 )
             ),
           ],
          ),
        ),

      ),
      drawer: globals.DrawerComun(),
      bottomNavigationBar: Padding(
       padding: EdgeInsets.only(bottom: 10),
       child: Container(
           decoration: new BoxDecoration(
             gradient: new LinearGradient(
               colors: globals.gradienteAzul,
               begin: FractionalOffset.centerLeft,
               end: FractionalOffset.centerRight,
             ),
           ),
           child: Padding(
             padding: EdgeInsets.all(10),
             child: FlatButton(
               child: new Text('Confirmar Orçamento',
                 style: TextStyle(
                     color: Colors.white,
                     fontSize: 25
                 ),
               ),
               onPressed: () {},
             ),
           )
       ),
      )
    );
  }
}
