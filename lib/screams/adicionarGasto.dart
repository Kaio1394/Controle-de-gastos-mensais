import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastos_novo/model/gasto.dart';


class AdicionarGastos extends StatefulWidget {
  @override
  _AdicionarGastosState createState() => _AdicionarGastosState();
}

class _AdicionarGastosState extends State<AdicionarGastos> {
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Gastos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Descrição do gasto',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Valor do gasto',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            width: 450,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  final String descricao = _descricaoController.text;
                  final double valor = double.parse(_valorController.text);
                  final Gastos gastos = Gastos(descricao, valor);
                },
                child: Text('Adicionar', style: TextStyle(
                  fontSize: 20
                ),),

              ),
            ),
          )
        ],
      ),
    );
  }
}
