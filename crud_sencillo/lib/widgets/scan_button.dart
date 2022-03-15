import 'package:flutter/material.dart';
import 'package:crud_sencillo/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class SaveButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        

      },
      );
  }
}