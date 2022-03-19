// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_sencillo/providers/persona_list_provider.dart';
import 'package:crud_sencillo/providers/scan_list_provider.dart';
import 'package:crud_sencillo/widgets/scan_tiles.dart';




class HomeScreen extends StatefulWidget {
  
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    String name = '';
    String email = '';

    return MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (_) => DatosListProvider(), ),
        ChangeNotifierProvider (create: (_) => DatoListProvider(), )
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD Sencillo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('CRUD Sencillo'),
          ),
          body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
            child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                    ),
                    initialValue: '',
                    onChanged: (value) {name=value;},
                  ),
                  
                  const SizedBox(height: 30,),
    
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    initialValue: '',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {email=value;},
                  ),
    
                  
    
                  ElevatedButton(
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Guardar'))),
                    onPressed: (){
                      final nuevoIngreso = DatoListProvider() ;
                      nuevoIngreso.nuevoDato(name, email);
                      setState(() { });
                    }
                  ),
    
                  
                    Container(
                      height: 800,
                      child: const ScanTiles(
                      
                      )
                    ),   
                  
                ],
                ),
            )
            ),
          )
        ),
      ),
    );
  }
}