import 'package:flutter/material.dart';

class ImagenInput extends StatefulWidget {
  @override
  _ImagenInputState createState() => _ImagenInputState();
}

class _ImagenInputState extends State<ImagenInput> {
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
        ),
        SizedBox(height: 10),
        Expanded(
          child: FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.cloud_upload),
            label: Text('subir Foto'),
            textColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
