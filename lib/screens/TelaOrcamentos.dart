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
                child:


                 TextField(
                  decoration: InputDecoration(
                      hintText: "Informe o modelo do veículo",
                      labelText: "Modelo",
                      labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black
                      )
                  ),
                  onSubmitted: (String texto){

                    print("valor digitado:" +  texto);

                  },
                  controller: _carroController,
                )
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
                       color: Colors.black)),
                   maskedTextFieldController: _placaController,
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
