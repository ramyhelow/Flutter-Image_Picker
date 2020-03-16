import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePicture extends StatefulWidget {
  @override
  _TakePictureState createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {

  File _file;

  void getImage() async {
    _file = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:  _file != null ? FileImage(_file) : Text('Please Take a Picture'),
              fit: BoxFit.cover,
            ),
          ),
          child: _file != null ? Image.file(_file, fit: BoxFit.fill,) : Center(child: Text('Please Take a Picture')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getImage();
        },
        child: Icon(
          Icons.camera,
        ),
      ),
    );
  }
}
