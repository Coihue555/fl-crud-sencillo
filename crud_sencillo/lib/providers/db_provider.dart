import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:crud_sencillo/models/dato_model.dart';
export 'package:crud_sencillo/models/dato_model.dart';

class DBProvider {
<<<<<<< HEAD

=======
>>>>>>> dd366c115b86a8d61088ad9bbf94bbb05b25a40e
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<dynamic> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'PersonasDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Datos(
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            email TEXT
          )

        ''');
    });
  }

  Future<int> nuevoDato(DatoModel nuevoDato) async {
    final id = nuevoDato.id;
    final nombre = nuevoDato.nombre;
    final email = nuevoDato.email;

    //verificar la db
    final db = await database;

    final res = await db!.rawInsert('''
      INSERT INTO Datos(id, nombre, email)
        VALUES( $id, '$nombre', '$email')
      ''');

    return res;
  }

  Future<int> nuevoDatoRaw(DatoModel nuevoDato) async {
    final db = await database;
    final res = await db!.insert('Datos', nuevoDato.toJson());
    //id del ultimo registro
    return res;
  }

  Future<DatoModel?> getDatosById(int id) async {
    final db = await database;
    final res = await db!.query('Datos', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? DatoModel.fromJson(res.first) : null;
  }

  Future<List<DatoModel>?> getTodos() async {
    final db = await database;
    final res = await db!.query('Datos', orderBy: 'id DESC');

    return res.isNotEmpty ? res.map((s) => DatoModel.fromJson(s)).toList() : [];
  }

<<<<<<< HEAD
    Future<DatoModel> getDatosByNombre(String nombre) async {
      final db = await database;
      final res = await db!.rawQuery('''
        SELECT * FROM Datos WHERE nombre = '$nombre'
      ''');

      return res.isNotEmpty
        ? res.map((s) => DatoModel.fromJson(s)).toList().first
        : DatoModel(nombre: '', email: '');
    }
=======
  Future<List<DatoModel>?> getDatosByNombre(String nombre) async {
    final db = await database;
    final res = await db!.rawQuery('''
        SELECT * FROM Datos WHERE nombre = '$nombre'
      ''');

    return res.isNotEmpty ? res.map((s) => DatoModel.fromJson(s)).toList() : [];
  }
>>>>>>> dd366c115b86a8d61088ad9bbf94bbb05b25a40e

  Future<int> updateDato(DatoModel nuevoDato) async {
    final db = await database;
    final res = await db!.update('Datos', nuevoDato.toJson(),
        where: 'id = ?', whereArgs: [nuevoDato.id]);

    return res;
  }

  Future<int> updateItem(int id, String nombre, String? email) async {
    final db = await database;

    final data = {
      'nombre': nombre,
      'email': email,
    };

    final result =
        await db!.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<DatoModel?> getScansById(int id) async {
    final db = await database;
    final res = await db!.query('Datos', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? DatoModel.fromJson(res.first) : null;
  }

  Future<int> updateScan(DatoModel nuevoScan) async {
    final db = await database;
    final res = await db!.update('Datos', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);

    return res;
  }

  Future<int> deleteDato(int id) async {
    final db = await database;
    final res = await db!.delete('Datos', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllDatos() async {
    final db = await database;
    final res = await db!.delete('Datos');
    return res;
  }
}
