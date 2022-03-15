import 'package:flutter/material.dart';
import 'package:crud_sencillo/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';


//no estoy usando este
class DatosTiles extends StatelessWidget {

  final String nombre;

  const DatosTiles({
    required this.nombre
  });

  @override
  Widget build(BuildContext context) {
    final datosListProvider = Provider.of<DatoListProvider>(context);
    final datos = datosListProvider.datos;

    return ListView.builder(
      itemCount: datos.length,
      itemBuilder: (_, i)=> ListTile(
        leading: Icon(Icons.home,
        color: Theme.of(context).primaryColor
        ),
        title: Text( datos[i].email.toString() ),
        subtitle: Text(datos[i].id.toString()),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey,),
        //onTap: ()=> (context, datos[i]),
      )
      );
  }
}
