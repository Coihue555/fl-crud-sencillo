// ignore_for_file: avoid_print

import 'package:crud_sencillo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_sencillo/providers/db_provider.dart';
import 'package:crud_sencillo/providers/persona_list_provider.dart';

class FichaScreen extends StatefulWidget {
  @override
  State<FichaScreen> createState() => _FichaScreenState();
}

class _FichaScreenState extends State<FichaScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey2 = GlobalKey<FormState>();
    final datoListProvider =
        Provider.of<DatosListProvider>(context, listen: false);

    final TextEditingController _nombreController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edicion'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<List<DatoModel>>(
              //revisar
              future: datoListProvider.cargarTodos(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data![0].nombre);
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Form(
                        key: myFormKey2,
                        child: Column(
                          children: [
                            TextField(
                              controller: _nombreController,
                              decoration: const InputDecoration(
                                labelText: 'Nombre',
                              ),
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) async {},
                            ),
                            ElevatedButton(
                                child: const SizedBox(
                                    width: double.infinity,
                                    child: Center(child: Text('Guardar'))),
                                onPressed: () async {
                                  await datoListProvider
                                      .actualizarItem(snapshot.data?[0].id);
                                  _nombreController.text = '';
                                  _emailController.text = '';
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
                                }),
                          ],
                        ),
                      ));
                }
                return const CircularProgressIndicator();
              }),
        ));
  }
}
