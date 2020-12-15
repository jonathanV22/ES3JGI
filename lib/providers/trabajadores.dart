import 'dart:io';

import 'package:cancha_de_tennis/helpers/db_helper.dart';
import 'package:cancha_de_tennis/models/trabajador_model.dart';
import 'package:flutter/foundation.dart';

class Trabajadores extends ChangeNotifier {
  DBHelper dbhelper = DBHelper();
  List<Trabajador> _items = [];

  List<Trabajador> get items {
    return [..._items];
  }

  Trabajador buscarTrabajador(String rut) {
    return _items.firstWhere((empleado) => empleado.rut == rut);
  }

  Future<void> eliminarTrabajador(String rut) async {
    final tBuscado = buscarTrabajador(rut);
    _items.remove(tBuscado);
    notifyListeners();
    dbhelper.eliminar('trabajadores', tBuscado.rut);
  }

  Future<void> allTrabajadores() async {
    final listaTrabajadores = await dbhelper.obtenerDatos('trabajadores');
    _items = listaTrabajadores
        .map((item) => Trabajador(
            rut: item['rut'],
            nombre: item['nombre '],
            apellido: item['apellido'],
            domicilio: item['domicilio'],
            cargo: item['cargo'],
            correo: item['correo'],
            telefono: item['telefono'],
            imagen: item['imagen']))
        .toList();
    notifyListeners();
  }

  Future<void> agregarTrabajador(
      String rut,
      String nombre,
      String apellido,
      String domicilio,
      String cargo,
      String correo,
      String telefono,
      File imagen) async {
    final nuevoTrabajador = Trabajador(
        rut: rut,
        nombre: nombre,
        apellido: apellido,
        domicilio: domicilio,
        cargo: cargo,
        correo: correo,
        telefono: telefono,
        imagen: imagen);
    _items.add(nuevoTrabajador);
    notifyListeners();
    dbhelper.insertar('trabajadores', {
      'rut': nuevoTrabajador.rut,
      'nombre': nuevoTrabajador.nombre,
      'apellido': nuevoTrabajador.apellido,
      'domicilio': nuevoTrabajador.domicilio,
      'cargo': nuevoTrabajador.cargo,
      'correo': nuevoTrabajador.correo,
      'telefono': nuevoTrabajador.telefono,
      'imagen': nuevoTrabajador.imagen
    });
  }
}
