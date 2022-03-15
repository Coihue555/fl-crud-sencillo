import 'package:flutter/material.dart';
import 'package:crud_sencillo/models/dato_model.dart';
import 'package:crud_sencillo/providers/db_provider.dart';

class DatosListProvider extends ChangeNotifier{
  List<DatoModel> datos = [];

  Future<DatoModel> nuevoDato(String nombre) async {
    final nuevoDato =  DatoModel(nombre: nombre);
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



}