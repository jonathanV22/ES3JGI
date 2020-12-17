import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImagenInput extends StatefulWidget {
  final Function onSelectImagen;
  ImagenInput(this.onSelectImagen);
  @override
  _ImagenInputState createState() => _ImagenInputState();
}

class _ImagenInputState extends State<ImagenInput> {
  File imagenGuardada;
  final _picker = ImagePicker();
  Future<void> tomarFoto() async {
    final pickedFile =
        await _picker.getImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedFile == null) {
      return null;
    }
    final File file = File(pickedFile.path);
    setState(() {
      imagenGuardada = file;
    });
    final appDir = await syspaths
        .getApplicationDocumentsDirectory(); //accedo a carpeta del dispositivo
    final fileName = path.basename(file.path);
    final savedImage = await file.copy('${appDir.path}/$fileName');
    widget.onSelectImagen(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 150,
          height: 150,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          child: imagenGuardada != null
              ? Image.file(
                  imagenGuardada,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'Ninguna imagen tomada',
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: FlatButton.icon(
            onPressed: tomarFoto,
            icon: Icon(Icons.camera),
            label: Text('subir Foto'),
            textColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
