import 'dart:io';
import 'package:gastos_novo/model/gasto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase(){
  return getDatabasesPath().then((dbPath){
    final String path = join(dbPath, 'listaGastos.db');
    return openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE gastos('
          'id INTEGER PRIMARY KEY, '
          'descricao TEXT, '
          'valor DOUBLE)');
    }, version: 1);
  });
}

Future<int> saveData(Gastos gastos){
  return createDatabase().then((db){
    final Map<String, dynamic> MapGastos = Map();
    MapGastos['descricao'] = gastos.descricao;
    MapGastos['valor'] = gastos.valor;

    return db.insert('gastos', MapGastos);
  });
}

Future<List<Gastos>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Gastos> gastos = List();
      for (Map<String, dynamic> map in maps) {
        final Gastos gasto = Gastos(
          map['descricao'],
          map['valor'],
        );
        gastos.add(gasto);
      }
      return gastos;
    });
  });
}