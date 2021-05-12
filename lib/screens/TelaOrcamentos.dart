import 'package:flutter/material.dart';
import 'package:isslercar/main.dart';
import 'package:isslercar/screens/TelaPrincipal.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;
import 'package:mask_shifter/mask_shifter.dart';
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

  _salvarDados() {
    var _variaveisVazias = "";
    if (_nomeController.text == "") {
      _variaveisVazias = _variaveisVazias + "Nome / ";
    }
    if (_numeroController.text == "") {
      _variaveisVazias = _variaveisVazias + "Número / ";
    }
    if (_enderecoController.text == "") {
      _variaveisVazias = _variaveisVazias + "Endereço / ";
    }
    if (_carroController.text == "") {
      _variaveisVazias = _variaveisVazias + "Modelo / ";
    }
    if (_anoController.text == "") {
      _variaveisVazias = _variaveisVazias + "Ano / ";
    }
    if (_motorController.text == "") {
      _variaveisVazias = _variaveisVazias + "Motor / ";
    }
    if (_placaController.text == "") {
      _variaveisVazias = _variaveisVazias + "Placa / ";
    }
    if (_corController.text == "") {
      _variaveisVazias = _variaveisVazias + "Cor / ";
    }
    if (_dataController.text == "") {
      String data = DateFormat("dd/MM/yyyy").format(DateTime.now());
      _dataController.text = data.toString();
    }
    if (_pecasController.text == "") {
      _variaveisVazias = _variaveisVazias + "Peças / ";
    }

    if (_variaveisVazias == "") {
      try {
        globals.db.collection("orcamentos").add({
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
        });
      } on Exception catch (_) {
        print("erro");
        globals.enviarExcessao(context,
            "Favor Bater um print da tela e enviar para o desenvolvedor contato (45)99970-2182 , erro: ${_.toString()}");
      }
    } else {
      globals.enviarExcessao(
          context, "Favor Preencher os campos: ${_variaveisVazias}");
    }
  }


  var _focusNodes = List.generate(9, (index) => FocusNode());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Row(
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
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "DADOS DO CLIENTE",
                  style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: "Nome do Cliente",
                      labelText: "Nome",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue)),
                  controller: _nomeController,
                onSubmitted: (text){
                  _focusNodes[0].requestFocus();
                },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextField(
                  focusNode: _focusNodes[0],
                  inputFormatters: [
                    MaskedTextInputFormatterShifter(
                        maskONE: "(XX)XXXXX-XXXX", maskTWO: "(XX)XXXXX-XXXX")
                  ],
                  onSubmitted: (text) {_focusNodes[1].requestFocus();},
                  maxLength: 14,
                  keyboardType: TextInputType.datetime,
                  decoration: new InputDecoration(
                      hintText: "Número do Cliente",
                      labelText: "Número",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue)),
                  controller: _numeroController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextField(
                  focusNode: _focusNodes[1],
                  decoration: InputDecoration(
                      hintText: "Endereço do Cliente",
                      labelText: "Endereço",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue)),
                  onSubmitted: (text) {_focusNodes[2].requestFocus();},
                  controller: _enderecoController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "DADOS DO VEICULO",
                  style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                  child: Row(children: [
                    Expanded(
                        flex: 3,
                        child: TextField(
                          focusNode: _focusNodes[2],
                          decoration: InputDecoration(
                              hintText: "Modelo do veículo",
                              labelText: "Modelo",
                              labelStyle:
                                  TextStyle(fontSize: 20, color: Colors.blue)),
                          onSubmitted: (text) {_focusNodes[3].requestFocus();},
                          controller: _carroController,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            focusNode: _focusNodes[3],
                            inputFormatters: [
                              MaskedTextInputFormatterShifter(
                                  maskONE: "XXXX/XXXX", maskTWO: "XXXX/XXXX")
                            ],
                            onSubmitted: (text) {_focusNodes[4].requestFocus();},
                            keyboardType: TextInputType.datetime,
                            maxLength: 9,
                            decoration: new InputDecoration(
                                hintText: "Ano Veículo",
                                labelText: "Ano",
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.blue)),
                            controller: _anoController,
                          ),
                        ))
                  ])),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextField(
                  focusNode: _focusNodes[4],
                  decoration: InputDecoration(
                      hintText: "Motor",
                      labelText: "Motor do veiculo",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue)),
                  onSubmitted: (text) {_focusNodes[5].requestFocus();},
                  controller: _motorController,
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextField(
                    focusNode: _focusNodes[5],
                    inputFormatters: [
                      MaskedTextInputFormatterShifter(
                          maskONE: "XXX-XXXX", maskTWO: "XXX-XXXX")
                    ],
                    maxLength: 8,
                    onSubmitted: (text) {_focusNodes[6].requestFocus();},
                    decoration: new InputDecoration(
                        hintText: "Informe a placa do veículo",
                        labelText: "Placa",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blue)),
                    controller: _placaController,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Row(children: [
                    Expanded(
                        flex: 3,
                        child: TextField(
                          focusNode: _focusNodes[6],
                          decoration: InputDecoration(
                              hintText: "Cor",
                              labelText: "Cor",
                              labelStyle:
                                  TextStyle(fontSize: 20, color: Colors.blue)),
                          onSubmitted: (text) {_focusNodes[7].requestFocus();},
                          controller: _corController,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            focusNode: _focusNodes[7],
                            inputFormatters: [
                              MaskedTextInputFormatterShifter(
                                  maskONE: "XX/XX/XXXX", maskTWO: "XX/XX/XXXX")
                            ],
                            keyboardType: TextInputType.datetime,
                            maxLength: 10,
                            onSubmitted: (text) {_focusNodes[8].requestFocus();},
                            decoration: new InputDecoration(
                                hintText: "Data Entrada",
                                labelText: "Entrada",
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.blue)),
                            controller: _dataController,
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: Icon(Icons.calendar_today),
                        onTap: () {
                          String data =
                              DateFormat("dd/MM/yyyy").format(DateTime.now());
                          _dataController.text = data.toString();
                        },
                      ),
                    ),
                  ])),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Column(
                    children: <Widget>[
                      Card(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          focusNode: _focusNodes[8],
                          maxLines: 8,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Peças",
                              hintText:
                                  "Informe as Peças para realizar o orçamento",
                              labelStyle:
                                  TextStyle(fontSize: 20, color: Colors.blue)),
                          onSubmitted: (text) {_salvarDados();},
                          controller: _pecasController,
                        ),
                      ))
                    ],
                  )),
            ],
          ),
        ),
      ),
      drawer: globals.DrawerComun(),
      bottomNavigationBar: GestureDetector(
        onTap: _salvarDados,
        child: Padding(
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
                  child: new Text(
                    'Confirmar Orçamento',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
