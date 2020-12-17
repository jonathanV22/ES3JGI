import 'package:cancha_de_tennis/providers/trabajadores.dart';
import 'package:cancha_de_tennis/screens/agregar_trabajador_screen.dart';
import 'package:cancha_de_tennis/screens/detalle_trabajador_screen.dart';
import 'package:cancha_de_tennis/screens/lista_trabajadores_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Trabajadores(),
      child: MaterialApp(
        title: 'Club de tennis',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        home: ListaTrabajadoresScreen(),
        routes: {
          AgregarTrabajador.routeName: (context) => AgregarTrabajador(),
          DetalleTrabajador.routeName: (context) => DetalleTrabajador()
        },
      ),
    );
  }
}
