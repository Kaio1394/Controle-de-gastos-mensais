import 'package:flutter/material.dart';
import 'package:gastos_novo/database/database.dart';
import 'package:gastos_novo/model/gasto.dart';
import 'package:gastos_novo/screams/adicionarGasto.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de gastos'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot){
          final List<Gastos> gastos = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index){
              final Gastos gasto = gastos[index];
              return _GastoItem(gasto);
            },
            itemCount: gastos.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context)=>AdicionarGastos()));
        },
        child: Icon(Icons.add, size: 30.0,),
      ),
    );
  }
}

class _GastoItem extends StatelessWidget {
  final Gastos gasto;

  _GastoItem(this.gasto);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        focusColor: Colors.black,
        title: Text(
          gasto.descricao,
          style: TextStyle(fontSize: 22.0),
        ),
        subtitle: Text(
          gasto.valor.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
