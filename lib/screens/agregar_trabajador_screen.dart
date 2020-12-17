import 'dart:io';

import 'package:cancha_de_tennis/providers/trabajadores.dart';
import 'package:cancha_de_tennis/widgets/imagen_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgregarTrabajador extends StatefulWidget {
  static const routeName = 'agregar_trabajador';
  @override
  _AgregarTrabajadorState createState() => _AgregarTrabajadorState();
}

class _AgregarTrabajadorState extends State<AgregarTrabajador> {
  final rutController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final domicilioController = TextEditingController();
  final cargoController = TextEditingController();
  final correoController = TextEditingController();
  final telefonoController = TextEditingController();

  File _imagenSeleccionada;
  void seleccionarImagen(File imagenSeleccionada) {
    _imagenSeleccionada = imagenSeleccionada;
  }

  void guardarTrabajador() {
    if (rutController.text.isEmpty ||
        nombreController.text.isEmpty ||
        apellidoController.text.isEmpty ||
        domicilioController.text.isEmpty ||
        cargoController.text.isEmpty ||
        correoController.text.isEmpty ||
        telefonoController.text.isEmpty ||
        _imagenSeleccionada == null) {
      return;
    }
    Provider.of<Trabajadores>(context, listen: false).agregarTrabajador(
        rutController.text,
        nombreController.text,
        apellidoController.text,
        domicilioController.text,
        cargoController.text,
        correoController.text,
        telefonoController.text,
        _imagenSeleccionada);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar trabajador'),
      ),
      body: ListView(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'R.U.T',
                    ),
                    controller: rutController,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                    ),
                    controller: nombreController,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Apellido',
                    ),
                    controller: apellidoController,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Domicilio',
                    ),
                    controller: domicilioController,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Cargo',
                    ),
                    controller: cargoController,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                    ),
                    controller: correoController,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Teléfono',
                    ),
                    controller: telefonoController,
                  ),
                  SizedBox(height: 5),
                  ImagenInput(seleccionarImagen),
                  SizedBox(height: 5)
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            onPressed: guardarTrabajador,
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
