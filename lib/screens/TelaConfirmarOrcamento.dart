import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:isslercar/main.dart';
import 'package:isslercar/screens/TelaListarOrcamentos.dart';
import 'package:isslercar/screens/TelaPrincipal.dart';
import 'package:isslercar/variaveis/globals.dart' as globals;
import 'package:mask_shifter/mask_shifter.dart';
import 'package:intl/intl.dart';

class TelaConfirmarOrcamento extends StatefulWidget {
  DocumentSnapshot doc;

  TelaConfirmarOrcamento(this.doc);

  @override
  _TelaConfirmarOrcamentoState createState() => _TelaConfirmarOrcamentoState();
}

class _TelaConfirmarOrcamentoState extends State<TelaConfirmarOrcamento> {
  List<Object> lista = [];

  var _controllersPecas;
  List valores = [];
  double valorTotal = 0;

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

  _confirmarOrcamento() {
    var _variaveisVazias = "";

    if (_variaveisVazias == "") {
      try {
        globals.db.collection("orcamentos confirmados").add({
          "numero_do_cliente": _numeroController.text.toString(),
          "endereco_do_cliente": _enderecoController.text.toString(),
          "nome_do_cliente": _nomeController.text.toString(),
          "modelo": _carroController.text.toString(),
          "placa": _placaController.text.toString(),
          "motor": _motorController.text.toString(),
          "ano": _anoController.text.toString(),
          "pecas": lista,
          "valores": valores,
          "valor total": valorTotal,
          "data de entrada": _dataController.text.toString(),
          "cor_do_veiculo": _corController.text.toString(),
          "status": "confirmado"
        });
        globals.db
            .collection("orcamentos avaliados")
            .document(widget.doc.documentID)
            .delete();

        globals.enviarSucesso(
            context, "Valor de orçamento Adicionado com sucesso");
        Navigator.pop(context);
        Navigator.pop(context);
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

  _setarDados() {
    setState(() {
      _nomeController.text = widget.doc.data['nome_do_cliente'];
      _numeroController.text = widget.doc.data['numero_do_cliente'];
      _enderecoController.text = widget.doc.data['endereco_do_cliente'];
      _carroController.text = widget.doc.data['modelo'];
      _placaController.text = widget.doc.data['placa'];
      _motorController.text = widget.doc.data['motor'];
      _anoController.text = widget.doc.data['ano'];
      lista = widget.doc.data['pecas'];
      valores = widget.doc.data['valores'];
      _dataController.text = widget.doc.data['data de entrada'];
      _corController.text = widget.doc.data['cor_do_veiculo'];
      for (int i = 0; i < lista.length; i++) {
        valorTotal =
            valorTotal + double.tryParse(valores[i].replaceAll(',', '.'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _setarDados();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Orçamento do cliente : ${_nomeController.text} ",
                  style: TextStyle(
                    fontSize:15
                  ),
            ),
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
              Padding(padding: EdgeInsets.only(top: 15)),
              Text(
                "Dono do carro: ",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                "${_nomeController.text.toUpperCase()} ",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Text(
                "Contato: ",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                "${_numeroController.text}",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Text(
                "Carro , Cor, Placa: ",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                " ${_carroController.text.toUpperCase()}, \n ${_corController.text.toUpperCase()},\n ${_placaController.text.toUpperCase()} ",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Column(
                    children: <Widget>[
                      Card(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          padding: EdgeInsets.all(20),
                          child: ListView.builder(
                              itemCount: lista.length,
                              itemBuilder: (context, indice) {
                                return ListTile(
                                  title: Text(
                                    "${lista[indice]} ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  subtitle: Text("RS ${valores[indice]}"),
                                );
                              }),
                        ),
                      ))
                    ],
                  )),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, top: 15, bottom: 15),
                      child: Text(
                        "Valor total: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, top: 15, bottom: 15),
                      child: Text(
                        "RS ${valorTotal}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 25, bottom: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        showDialog(context: context, builder: (context){

                          return AlertDialog(
                            title: Text("Confirmar exclusão do orçamento :"),
                            titlePadding: EdgeInsets.all(25),
                            titleTextStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.orange
                            ),
                            content: Text("Cliente: ${widget.doc.data['nome_do_cliente']} | Carro: ${widget.doc.data['modelo']} | Placa ${widget.doc.data['placa']}"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: (){
                                    globals.db.collection("orcamentos avaliados").document(widget.doc.documentID).delete();
                                    Navigator.pop(context);
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
                      child: Text("Excluir Serviço", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                      color: Colors.redAccent,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: globals.DrawerComun(),
      bottomNavigationBar: GestureDetector(
        onTap: _confirmarOrcamento,
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
                    'Iniciar Serviço',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
