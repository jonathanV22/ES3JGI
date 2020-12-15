import 'package:flutter/material.dart';

import 'agregar_lugar_screen.dart';

class ListaTrabajadoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Club de tennis'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AgregarTrabajador.routeName);
              })
        ],
      ),
    );
  }
}
