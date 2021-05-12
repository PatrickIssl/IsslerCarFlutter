import 'package:flutter/material.dart';
import 'package:isslercar/main.dart';
import 'package:isslercar/screens/TelaPrincipal.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;
import 'package:masked_text/masked_text.dart';
import 'package:intl/intl.dart';

class TelaOrcamentos extends StatefulWidget {
  @override
  _TelaOrcamentosState createState() => _TelaOrcamentosState();
}

class _TelaOrcamentosState extends State<TelaOrcamentos> {
  //cliente
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _numeroController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  //veiculo
  TextEditingController _carroController = TextEditingController();
  TextEditingController _placaController = TextEditingController();
  TextEditingController _motorController = TextEditingController();
  TextEditingController _anoController = TextEditingController();
  TextEditingController _pecasController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _corController = TextEditingController();




  _salvarDados(){
    var _variaveisVazias = "";
    if(_nomeController.text == ""){
      _variaveisVazias = _variaveisVazias + "Nome / ";
    }
    if(_numeroController.text == ""){
      _variaveisVazias = _variaveisVazias + "Número / ";
    }
    if(_enderecoController.text == ""){
      _variaveisVazias = _variaveisVazias + "Endereço / ";
    }
    if(_carroController.text == ""){
      _variaveisVazias = _variaveisVazias + "Modelo / ";
    }
    if(_anoController.text == ""){
      _variaveisVazias = _variaveisVazias + "Ano / ";
    }
    if(_motorController.text == ""){
      _variaveisVazias = _variaveisVazias + "Motor / ";
    }
    if(_placaController.text == ""){
      _variaveisVazias = _variaveisVazias + "Placa / ";
    }
    if(_corController.text == ""){
      _variaveisVazias = _variaveisVazias + "Cor / ";
    }
   if(_dataController.text == ""){
     String data = DateFormat("dd/MM/yyyy").format(DateTime.now());
     _dataController.text = data.toString();
   }
    if(_pecasController.text == ""){
       _variaveisVazias = _variaveisVazias + "Peças / ";
    }


    if(_variaveisVazias == "") {
      try {
        globals.db.collection("orcamentos").add(
            {
              "numero_do_cliente": _numeroController.text.toString(),
              "endereco_do_cliente": _enderecoController.text.toString(),
              "nome_do_cliente": _nomeController.text.toString(),
              "modelo": _carroController.text.toString(),
              "placa": _placaController.text.toString(),
              "motor": _motorController.text.toString(),
              "ano": _anoController.text.toString(),
              "pecas": _pecasController.text.toString(),
              "data de entrada": _dataController.text.toString(),
              "cor": _corController.text.toString()
            }
        );
      } on Exception catch (_) {
        print("erro");
        globals.enviarExcessao(context,
            "Favor Bater um print da tela e enviar para o desenvolvedor contato (45)99970-2182 , erro: ${_
                .toString()}");
      }
    }else{
      globals.enviarExcessao(context, "Favor Preencher os campos: ${_variaveisVazias}");
    }
  }


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
             Padding(padding: EdgeInsets.only(top: 15),
               child:Text("DADOS DO CLIENTE",
                 style: TextStyle(
                   fontSize: 20,
                   decoration: TextDecoration.underline,
                 ),),
             ),
             Padding(padding: EdgeInsets.fromLTRB(50,10,50,10),
               child: TextField(

                 decoration: InputDecoration(
                     hintText: "Nome do Cliente",
                     labelText: "Nome",
                     labelStyle: TextStyle(
                         fontSize: 20,
                         color: Colors.blue
                     )
                 ),
                 onSubmitted: (String texto){
                   print("valor digitado:" +  texto);
                 },
                 controller: _nomeController,
               ),
             ),
             Padding(padding: EdgeInsets.fromLTRB(50,10,50,10),
               child: MaskedTextField(
                 mask: "(xx)xxxxx-xxxx",
                 maxLength: 14,
                 keyboardType: TextInputType.phone,
                 inputDecoration: new InputDecoration(
                     hintText: "Número do Cliente",
                     labelText: "Número",
                     labelStyle: TextStyle(fontSize: 20,
                         color: Colors.blue)),
                 maskedTextFieldController: _numeroController,
               ),
             ),
             Padding(padding: EdgeInsets.fromLTRB(50,10,50,10),
               child: TextField(
                 decoration: InputDecoration(
                     hintText: "Endereço do Cliente",
                     labelText: "Endereço",
                     labelStyle: TextStyle(
                         fontSize: 20,
                         color: Colors.blue
                     )
                 ),
                 onSubmitted: (String texto){

                   print("valor digitado:" +  texto);

                 },
                 controller: _enderecoController,
               ),
             ),

             Padding(padding: EdgeInsets.only(top: 15),
              child:Text("DADOS DO VEICULO",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),),
             ),
          Padding(padding: EdgeInsets.fromLTRB(50, 0, 50 ,10),
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
                     keyboardType: TextInputType.datetime,
                     maxLength: 9,
                     inputDecoration: new InputDecoration(
                         hintText: "Ano Veículo",
                         labelText: "Ano",
                         labelStyle: TextStyle(fontSize: 20,
                             color: Colors.blue)),
                     maskedTextFieldController: _anoController,
                   ),
                 )
               )
             ])
          ),
             Padding(padding: EdgeInsets.fromLTRB(50,10,50,10),
               child: TextField(
                 decoration: InputDecoration(
                     hintText: "Motor",
                     labelText: "Motor do veiculo",
                     labelStyle: TextStyle(
                         fontSize: 20,
                         color: Colors.blue
                     )
                 ),
                 onSubmitted: (String texto){

                   print("valor digitado:" +  texto);

                 },
                 controller: _motorController,
               ),
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
                 child: Row(children: [
                   Expanded(
                       flex: 3,
                       child:
                       TextField(
                         decoration: InputDecoration(
                             hintText: "Cor",
                             labelText: "Cor",
                             labelStyle: TextStyle(
                                 fontSize: 20,
                                 color: Colors.blue
                             )
                         ),
                         onSubmitted: (String texto){

                           print("valor digitado:" +  texto);

                         },
                         controller: _corController,
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
                           mask: "xx/xx/xxxx",
                           keyboardType: TextInputType.datetime,
                           maxLength: 10,
                           inputDecoration: new InputDecoration(
                               hintText: "Data Entrada",
                               labelText: "Entrada",
                               labelStyle: TextStyle(fontSize: 20,
                                   color: Colors.blue)),
                           maskedTextFieldController: _dataController,
                         ),
                       )
                   ),
                   Expanded(
                     flex: 1,
                     child:  GestureDetector(
                       child: Icon(Icons.calendar_today),
                       onTap: (){
                         String data = DateFormat("dd/MM/yyyy").format(DateTime.now());
                         _dataController.text = data.toString();
                         },
                     ),
                   ),
                 ])
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
      bottomNavigationBar:
      GestureDetector(
        onTap: _salvarDados,
      child:Padding(
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

             ),
           )
       ),
      ),
    ),
    );
  }
}
