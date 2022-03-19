// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crud_sencillo/pages/ficha.dart';
import 'package:crud_sencillo/pages/home_page.dart';
import 'package:crud_sencillo/providers/persona_list_provider.dart';
import 'package:crud_sencillo/providers/scan_list_provider.dart';



void main() async {
  
  runApp(MyApp())

  ;}

class MyApp extends StatefulWidget {
  
  
  
  @override
  State<MyApp> createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    



    return MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (_) => DatosListProvider(), ),
        ChangeNotifierProvider (create: (_) => DatoListProvider(), )
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD Sencillo',
        initialRoute: 'Home',
        routes: {
          'Home'  : ( _ ) => HomeScreen(),
          'Ficha' : ( _ ) => FichaScreen(),
        },

      ),
    );
  }
}