import 'package:cancha_de_tennis/providers/trabajadores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'agregar_trabajador_screen.dart';
import 'detalle_trabajador_screen.dart';

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
      body: FutureBuilder(
          future: Provider.of<Trabajadores>(context, listen: false)
              .allTrabajadores(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<Trabajadores>(
                  child: Center(
                    child: Text('No hay trabajadores, ingresa algunos'),
                  ),
                  builder: (context, trabajadores, ch) => trabajadores
                              .items.length <=
                          0
                      ? ch
                      : ListView.builder(
                          itemCount: trabajadores.items.length,
                          itemBuilder: (context, i) => Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Se elimino el trabajador ' +
                                      trabajadores.items[i].nombre +
                                      ' ' +
                                      trabajadores.items[i].apellido)));
                              Provider.of<Trabajadores>(context, listen: false)
                                  .eliminarTrabajador(
                                      trabajadores.items[i].rut);
                            },
                            background: Container(
                              child: Center(
                                child: Text(
                                  'Eliminar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              color: Colors.red,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(trabajadores.items[i].imagen),
                              ),
                              title: Text('Rut: ' + trabajadores.items[i].rut),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Nombre: ' +
                                      trabajadores.items[i].nombre +
                                      ' ' +
                                      trabajadores.items[i].apellido),
                                  Text('Cargo: ' + trabajadores.items[i].cargo),
                                ],
                              ),
                              onTap: () => Navigator.of(context).pushNamed(
                                  DetalleTrabajador.routeName,
                                  arguments: trabajadores.items[i].rut),
                            ),
                          ),
                        ),
                )),
    );
  }
}
