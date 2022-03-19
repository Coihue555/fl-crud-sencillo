// ignore_for_file: avoid_print

import 'package:crud_sencillo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_sencillo/providers/db_provider.dart';
import 'package:crud_sencillo/providers/persona_list_provider.dart';
import 'package:crud_sencillo/providers/scan_list_provider.dart';




class FichaScreen extends StatefulWidget {
  
  
  @override
  State<FichaScreen> createState() => _FichaScreenState();
  
}

class _FichaScreenState extends State<FichaScreen> {
  @override
  Widget build(BuildContext context) {
    
    
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final datoListProvider = Provider.of<DatosListProvider>(context, listen: false);
    
    return Scaffold(
          appBar: AppBar(
            title: const Text('Edicion'),
          ),
          body: SingleChildScrollView(
          child: FutureBuilder<List<DatoModel>>(
            future: datoListProvider.cargarTodos(),
            builder: (context, snapshot) { 
              if(snapshot.hasData){
                return Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                  child: Form(
                  key: myFormKey,
                  child: Column(
                    children: [
                    
                      TextFormField(
                        
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                        ),
                        initialValue: snapshot.data![0].nombre.toString(),
                        onChanged: (value) {snapshot.data![0].nombre=value;},
                      ),
                      
                      const SizedBox(height: 30,),
                      
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        initialValue: snapshot.data![0].email.toString(),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {snapshot.data![0].email=value;},
                      ),
                
                    
              
                      ElevatedButton(
                        child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text('Guardar'))),
                        onPressed: (){
                          final nuevoIngreso = DatoListProvider() ;
                          nuevoIngreso.cargarDatos();
                          setState(() { });
                          Navigator.push(
                            context,
                            MaterialPageRoute( builder: (context) => HomeScreen() ),
                          );
                        }
                      ),
                 
                    
                  ],
                  ),
                  
              )
              );
              } return const CircularProgressIndicator();
              
            } 
          ),
          )
        );
  }
}
