// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crud_sencillo/pages/home_page.dart';
import 'package:crud_sencillo/providers/datos_list_provider.dart';

class FichaScreen extends StatefulWidget {
  @override
  State<FichaScreen> createState() => _FichaScreenState();
}

class _FichaScreenState extends State<FichaScreen> {
  @override
  Widget build(BuildContext context) {
    final elementoSeleccionado = Provider.of<DatosListProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edicion'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                        ),
                        initialValue:
                            elementoSeleccionado.datoSeleccionado.nombre,
                        onChanged: (value) {
                          elementoSeleccionado.datoSeleccionado.nombre = value;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        initialValue:
                            elementoSeleccionado.datoSeleccionado.email,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          elementoSeleccionado.datoSeleccionado.email = value;
                        },
                      ),
                      ElevatedButton(
                          child: const SizedBox(
                              width: double.infinity,
                              child: Center(child: Text('Guardar'))),
                          onPressed: () {
                            elementoSeleccionado.actualizarDatos(
                                elementoSeleccionado.datoSeleccionado.id!,
                                elementoSeleccionado.datoSeleccionado.nombre,
                                elementoSeleccionado.datoSeleccionado.email);
                            setState(() {});
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }),
                    ],
                  ),
                ))));
  }
}
