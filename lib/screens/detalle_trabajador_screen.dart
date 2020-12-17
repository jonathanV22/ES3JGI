import 'package:cancha_de_tennis/providers/trabajadores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalleTrabajador extends StatelessWidget {
  static const routeName = 'detalle_trabajador';
  @override
  Widget build(BuildContext context) {
    final rut = ModalRoute.of(context).settings.arguments;
    final trabajadorSeleccionado =
        Provider.of<Trabajadores>(context, listen: false).buscarTrabajador(rut);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle trabajador'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 150,
              child: Image.file(
                trabajadorSeleccionado.imagen,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Nombre: ' +
                trabajadorSeleccionado.nombre +
                '' +
                trabajadorSeleccionado.apellido,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'R.U.T: ' + trabajadorSeleccionado.rut,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'Cargo: ' + trabajadorSeleccionado.cargo,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'Correo: ' + trabajadorSeleccionado.correo,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'Domicilio: ' + trabajadorSeleccionado.domicilio,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'Teléfono: ' + trabajadorSeleccionado.telefono,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
