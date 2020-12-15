import 'dart:io';
import 'package:flutter/foundation.dart';

class Trabajador {
  final String rut;
  final String nombre;
  final String apellido;
  final String domicilio;
  final String cargo;
  final String correo;
  final String telefono;
  final File imagen;

  Trabajador(
      {@required this.rut,
      @required this.nombre,
      @required this.apellido,
      @required this.domicilio,
      @required this.cargo,
      @required this.correo,
      @required this.telefono,
      @required this.imagen});
}
