import 'package:flutter/material.dart';
import 'package:crud_sencillo/providers/scan_list_provider.dart';
import 'package:crud_sencillo/providers/ui_provider.dart';
import 'package:crud_sencillo/widgets/custom_navigatorbar.dart';
import 'package:crud_sencillo/widgets/scan_button.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Principal'),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<DatoListProvider>(context, listen: false).borrarLista();
            },
            icon: const Icon(Icons.delete_forever)
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: SaveButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    //final tempScan = new DatoModel(valor: 'http://google.com');
    //DBProvider.db.getTodosScans().then((s)=>s!.forEach((element) {print(element.valor);}));

    final datoListProvider = Provider.of<DatoListProvider>(context, listen: false);

    return HomePage();
  }
}