import 'package:flutter/material.dart';
import 'package:simple_crud/providers/db_provider.dart';

class DatoListProvider extends ChangeNotifier{
  List<DatoModel> datos = [];
  String tipoSeleccionado = 'http';

  Future<DatoModel> nuevoDato(String email, String nombre) async {
    final nuevoDato =  DatoModel(email: email, nombre: nombre);
    final id = await DBProvider.db.nuevoDato(nuevoDato);
    //asignar el ID de la base de datos al modelo
    nuevoDato.id = id;

    if(this.tipoSeleccionado==nuevoDato.nombre){
      this.datos.add(nuevoDato);
      notifyListeners();
    }    
    return nuevoDato;
  }

  cargarScans() async {
    final datos = await DBProvider.db.getTodos();
    this.datos = [...datos!];
    notifyListeners();
  }

  cargarDatosByNombre(String nombre) async {
    final datos = await DBProvider.db.getDatosByNombre(nombre);
    this.datos = [...datos!];
    this.tipoSeleccionado = nombre;
    notifyListeners();
  }

  borrarLista() async {
    await DBProvider.db.deleteAllDatos();
    this.datos = [];
    notifyListeners();
  }

  borrarSDatoById( int? id) async {
    await DBProvider.db.deleteDato(id!);
    cargarDatosByNombre(tipoSeleccionado);
  }

}