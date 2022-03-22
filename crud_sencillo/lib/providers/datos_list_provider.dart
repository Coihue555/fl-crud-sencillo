import 'package:flutter/material.dart';
import 'package:crud_sencillo/providers/db_provider.dart';

class DatosListProvider extends ChangeNotifier{
  List<DatoModel> datos = [];
  DatoModel datoSeleccionado = DatoModel(nombre: '', email: '');

  Future<DatoModel> nuevoDato(String nombre, String email ) async {
    final nuevoDato =  DatoModel(email: email, nombre: nombre);
    final id = await DBProvider.db.nuevoDato(nuevoDato);
    //asignar el ID de la base de datos al modelo
    nuevoDato.id = id;

    
      this.datos.add(nuevoDato);
      notifyListeners();
    
    return nuevoDato;
  }



  Future<List<DatoModel>> cargarTodos() async {
    final datos = await DBProvider.db.getTodos();
    this.datos = [...datos!];
    notifyListeners();
    return datos;


  }

  cargarDatosByNombre(String nombre) async {
    this.datoSeleccionado = await DBProvider.db.getDatosByNombre(nombre);
    
    notifyListeners();
  }

  borrarLista() async {
    await DBProvider.db.deleteAllDatos();
    this.datos = [];
    notifyListeners();
  }

  borrarDatoById( int? id) async {
    await DBProvider.db.deleteDato(id!);
    cargarTodos();
  }

  Future<DatoModel?> getDatosById(int id) async {
    datoSeleccionado = await DBProvider.db.getDatosById(id);
    
    notifyListeners();
  }

  Future<DatoModel?> actualizarDatos(int id, String nombreNvo, String emailNvo ) async {
    
    await DBProvider.db.updateItem(id, nombreNvo, emailNvo);
    cargarTodos();
    
  }

  

}