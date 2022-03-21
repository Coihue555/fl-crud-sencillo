import 'package:flutter/material.dart';
import 'package:crud_sencillo/providers/db_provider.dart';

class DatosListProvider extends ChangeNotifier {
  List<DatoModel> datos = [];

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<DatoModel> nuevoDato(String nombre, String email) async {
    final nuevoDato = DatoModel(nombre: nombre, email: email);
    final id = await DBProvider.db.nuevoDato(nuevoDato);
    //asignar el ID de la base de datos al modelo
    nuevoDato.id = id;

    datos.add(nuevoDato);
    notifyListeners();

    return nuevoDato;
  }

  Future<List<DatoModel>> cargarTodos() async {
    final datos = await DBProvider.db.getTodos();
    this.datos = [...datos!];
    notifyListeners();
    return datos;
  }

  Future<void> actualizarItem(int? id) async {
    await DBProvider.db
        .updateItem(id!, _nombreController.text, _emailController.text);
    notifyListeners();
  }

  Future<int> updateDato(nombre, email) async {
    final datos = await DBProvider.db.updateDato(nombre);

    notifyListeners();
    return datos;
  }
}
