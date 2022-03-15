import 'package:flutter/material.dart';
import 'package:crud_sencillo/models/dato_model.dart';
import 'package:crud_sencillo/providers/persona_list_provider.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatefulWidget {
  const ScanTiles({Key? key}) : super(key: key);

  @override
  State<ScanTiles> createState() => _ScanTilesState();
}

class _ScanTilesState extends State<ScanTiles> {
  @override
  Widget build(BuildContext context) {
    final datoListProvider = Provider.of<DatosListProvider>(context, listen: false);


    return FutureBuilder<List<DatoModel>>(
      future: datoListProvider.cargarTodos(),
      builder:(context, snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, i)=> ListTile(
            leading: Icon(Icons.home,
            color: Theme.of(context).primaryColor
          ),
          title: Text( 'Nombre: ' + snapshot.data![i].email.toString() + ' ' + 'Email: ' + snapshot.data![i].nombre.toString() ),
          subtitle: Text(snapshot.data![i].id.toString()),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey,),
          //onTap: ()=> launchURL(context, scans[i]),
        )
        );
        } return const CircularProgressIndicator();
      },
    );
  }
}