// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:isslercar/entity/Orcamento.dart';
// import 'package:isslercar/main.dart';
// import 'package:isslercar/screens/TelaListarOrcamentos.dart';
// import 'package:isslercar/screens/TelaPrincipal.dart';
// import 'package:isslercar/variaveis/globals.dart' as globals;
// import 'package:mask_shifter/mask_shifter.dart';
// import 'package:intl/intl.dart';
//
// class TelaEditarOrcamentos extends StatefulWidget {
//
//   Orcamento doc;
//
//   TelaEditarOrcamentos(this.doc);
//
//   @override
//   _TelaEditarOrcamentosState createState() => _TelaEditarOrcamentosState();
// }
//
// class _TelaEditarOrcamentosState extends State<TelaEditarOrcamentos> {
//   List<Object> lista = [];
//
//   var _controllersPecas;
//
//
//   //cliente
//   TextEditingController _nomeController = TextEditingController();
//   TextEditingController _numeroController = TextEditingController();
//   TextEditingController _enderecoController = TextEditingController();
//
//   //veiculo
//   TextEditingController _carroController = TextEditingController();
//   TextEditingController _placaController = TextEditingController();
//   TextEditingController _motorController = TextEditingController();
//   TextEditingController _anoController = TextEditingController();
//   TextEditingController _pecasController = TextEditingController();
//   TextEditingController _dataController = TextEditingController();
//   TextEditingController _corController = TextEditingController();
//
//   _salvarDados() {
//     List valores = [];
//
//     for(int i = 0 ; i < lista.length; i++){
//       valores.add('${_controllersPecas[i].text}');
//     }
//
//     var _variaveisVazias = "";
//     if (_nomeController.text == "") {
//       _variaveisVazias = _variaveisVazias + "Nome / ";
//     }
//     if (_numeroController.text == "") {
//       _variaveisVazias = _variaveisVazias + "Número / ";
//     }
//     if (_enderecoController.text == "") {
//       _variaveisVazias = _variaveisVazias + "Endereço / ";
//     }
//     if (_carroController.text == "") {
//       _variaveisVazias = _variaveisVazias + "Modelo / ";
//     }
//     if (_anoController.text == "") {
//       _variaveisVazias = _variaveisVazias + "Ano / ";
//     }
//     if (_motorController.text == "") {
//       _variaveisVazias = _variaveisVazias + "Motor / ";
//     }
//     if (_placaController.text == "") {
//       _variaveisVazias = _variaveisVazias + "Placa / ";
//     }
//     if (_corController.text == "") {
//       _variaveisVazias = _variaveisVazias + "Cor / ";
//     }
//     if (_dataController.text == "") {
//       String data = DateFormat("dd/MM/yyyy").format(DateTime.now());
//       _dataController.text = data.toString();
//     }
//     if (_controllersPecas[0].text == "") {
//       _variaveisVazias = _variaveisVazias + "Valores / ";
//     }
//
//     if (_variaveisVazias == "") {
//       try {
//         globals.db.collection("orcamentos avaliados").add({
//           "numero_do_cliente": _numeroController.text.toString(),
//           "endereco_do_cliente": _enderecoController.text.toString(),
//           "nome_do_cliente": _nomeController.text.toString(),
//           "modelo": _carroController.text.toString(),
//           "placa": _placaController.text.toString(),
//           "motor": _motorController.text.toString(),
//           "ano": _anoController.text.toString(),
//           "pecas": lista,
//           "valores": valores,
//           "data de entrada": _dataController.text.toString(),
//           "cor_do_veiculo": _corController.text.toString(),
//           "status": "avaliado"
//         });
//
//         globals.db.collection("orcamentos").document(widget.doc.documentID).delete();
//
//         globals.enviarSucesso(context, "Valor de orçamento Adicionado com sucesso");
//         Navigator.pop(context);
//         Navigator.pop(context);
//       } on Exception catch (_) {
//         print("erro");
//         globals.enviarExcessao(context,
//             "Favor Bater um print da tela e enviar para o desenvolvedor contato (45)99970-2182 , erro: ${_.toString()}");
//       }
//     } else {
//       globals.enviarExcessao(
//           context, "Favor Preencher os campos: ${_variaveisVazias}");
//     }
//   }
//
//   _setarDados(){
//     setState(() {
//       _nomeController.text = widget.doc.data['nome_do_cliente'];
//       _numeroController.text = widget.doc.data['numero_do_cliente'];
//       _enderecoController.text = widget.doc.data['endereco_do_cliente'];
//       _carroController.text = widget.doc.data['modelo'];
//       _placaController.text = widget.doc.data['placa'];
//       _motorController.text = widget.doc.data['motor'];
//       _anoController.text = widget.doc.data['ano'];
//       lista = widget.doc.data['pecas'];
//       _controllersPecas = List.generate(lista.length, (index) => TextEditingController());
//       _dataController.text = widget.doc.data['data de entrada'];
//       _corController.text = widget.doc.data['cor_do_veiculo'];
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _setarDados();
//     return Scaffold(
//       appBar: AppBar(
//         leading: new IconButton(
//             icon: new Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Editando ${widget.doc.data["modelo"]} placa ${widget.doc.data["placa"]}"),
//           ],
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: globals.colorsFundo,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(top: 15),
//                 child: Text(
//                   "DADOS DO CLIENTE",
//                   style: TextStyle(
//                     fontSize: 20,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//                 child: TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                       hintText: "Nome do Cliente",
//                       labelText: "Nome",
//                       labelStyle: TextStyle(fontSize: 20, color: Colors.blue)),
//                   controller: _nomeController,
//                   onSubmitted: (text){
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//                 child: TextField(
//                   enabled: false,
//                   inputFormatters: [
//                     MaskedTextInputFormatterShifter(
//                         maskONE: "(XX)XXXXX-XXXX", maskTWO: "(XX)XXXXX-XXXX")
//                   ],
//                   maxLength: 14,
//                   keyboardType: TextInputType.datetime,
//                   decoration: new InputDecoration(
//                       hintText: "Número do Cliente",
//                       labelText: "Número",
//                       labelStyle: TextStyle(fontSize: 20, color: Colors.blue)),
//                   controller: _numeroController,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//                 child: TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                       hintText: "Endereço do Cliente",
//                       labelText: "Endereço",
//                       labelStyle: TextStyle(fontSize: 20, color: Colors.blue)),
//                   controller: _enderecoController,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 15),
//                 child: Text(
//                   "DADOS DO VEICULO",
//                   style: TextStyle(
//                     fontSize: 20,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//               Padding(
//                   padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
//                   child: Row(children: [
//                     Expanded(
//                         flex: 3,
//                         child: TextField(
//                           enabled: false,
//                           decoration: InputDecoration(
//                               hintText: "Modelo do veículo",
//                               labelText: "Modelo",
//                               labelStyle:
//                               TextStyle(fontSize: 20, color: Colors.blue)),
//                           controller: _carroController,
//                         )),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Expanded(
//                         flex: 2,
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 20),
//                           child: TextField(
//                             enabled: false,
//                             inputFormatters: [
//                               MaskedTextInputFormatterShifter(
//                                   maskONE: "XXXX/XXXX", maskTWO: "XXXX/XXXX")
//                             ],
//                             keyboardType: TextInputType.datetime,
//                             maxLength: 9,
//                             decoration: new InputDecoration(
//                                 hintText: "Ano Veículo",
//                                 labelText: "Ano",
//                                 labelStyle: TextStyle(
//                                     fontSize: 20, color: Colors.blue)),
//                             controller: _anoController,
//                           ),
//                         ))
//                   ])),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//                 child: TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                       hintText: "Motor",
//                       labelText: "Motor do veiculo",
//                       labelStyle: TextStyle(fontSize: 20, color: Colors.blue)),
//                   controller: _motorController,
//                 ),
//               ),
//               Padding(
//                   padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//                   child: TextField(
//                     enabled: false,
//                     inputFormatters: [
//                       MaskedTextInputFormatterShifter(
//                           maskONE: "XXX-XXXX", maskTWO: "XXX-XXXX")
//                     ],
//                     maxLength: 8,
//                     decoration: new InputDecoration(
//                         hintText: "Informe a placa do veículo",
//                         labelText: "Placa",
//                         labelStyle:
//                         TextStyle(fontSize: 20, color: Colors.blue)),
//                     controller: _placaController,
//                   )),
//               Padding(
//                   padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//                   child: Row(children: [
//                     Expanded(
//                         flex: 3,
//                         child: TextField(
//                           enabled: false,
//                           decoration: InputDecoration(
//                               hintText: "Cor",
//                               labelText: "Cor",
//                               labelStyle:
//                               TextStyle(fontSize: 20, color: Colors.blue)),
//                           controller: _corController,
//                         )),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Expanded(
//                         flex: 2,
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 20),
//                           child: TextField(
//                             enabled: false,
//                             inputFormatters: [
//                               MaskedTextInputFormatterShifter(
//                                   maskONE: "XX/XX/XXXX", maskTWO: "XX/XX/XXXX")
//                             ],
//                             keyboardType: TextInputType.datetime,
//                             maxLength: 10,
//                             decoration: new InputDecoration(
//                                 hintText: "Data Entrada",
//                                 labelText: "Entrada",
//                                 labelStyle: TextStyle(
//                                     fontSize: 20, color: Colors.blue)),
//                             controller: _dataController,
//                           ),
//                         )),
//
//                   ])),
//               Padding(
//                   padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//                   child: Column(
//                     children: <Widget>[
//                       Card(
//                           child: Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Container(
//                               height: 300,
//                               padding: EdgeInsets.all(20),
//                               child: ListView.builder(
//                                   itemCount: lista.length,
//                                   itemBuilder: (context, indice) {
//                                     return ListTile(
//                                       subtitle:
//                                       TextField(
//                                         controller: _controllersPecas[indice],
//                                         decoration: InputDecoration(
//                                             hintText: "Valor da peça : ${lista[indice]}",
//                                             labelText: lista[indice],
//                                             labelStyle:
//                                             TextStyle(fontSize: 20, color: Colors.blue)),
//                                         onSubmitted: (text) {
//                                           print(_controllersPecas[indice].text);
//                                         }
//                                       )
//
//                                     );
//                                   }),
//                             ),
//                           ))
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ),
//       drawer: globals.DrawerComun(),
//       bottomNavigationBar: GestureDetector(
//         onTap: _salvarDados,
//         child: Padding(
//           padding: EdgeInsets.only(bottom: 10),
//           child: Container(
//               decoration: new BoxDecoration(
//                 gradient: new LinearGradient(
//                   colors: globals.gradienteAzul,
//                   begin: FractionalOffset.centerLeft,
//                   end: FractionalOffset.centerRight,
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(10),
//                 child: FlatButton(
//                   child: new Text(
//                     'Confirmar Orçamento',
//                     style: TextStyle(color: Colors.white, fontSize: 25),
//                   ),
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
// }
