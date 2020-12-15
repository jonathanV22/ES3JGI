import 'package:cancha_de_tennis/widgets/imagen_input.dart';
import 'package:flutter/material.dart';

class AgregarTrabajador extends StatefulWidget {
  static const routeName = 'agregar_trabajador';
  @override
  _AgregarTrabajadorState createState() => _AgregarTrabajadorState();
}

class _AgregarTrabajadorState extends State<AgregarTrabajador> {
  final tituloController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar trabajador'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'R.U.T'),
                    controller: tituloController,
                  ),
                  SizedBox(height: 10),
                  ImagenInput(),
                  SizedBox(height: 10)
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            onPressed: () {},
            label: Text('Agregar'),
            color: Theme.of(context).accentColor,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    );
  }
}
