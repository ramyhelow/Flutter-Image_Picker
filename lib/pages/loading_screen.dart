import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

void goToTakePicture(){

}

class _LoadingScreenState extends State<LoadingScreen>{

  File _file;

  void getImage() async {
    _file = await ImagePicker.pickImage(source: ImageSource.camera);
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    Fluttertoast.showToast(
        msg: "Image was uploaded successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    //setState(() {});
  }

  void goToTakePicture(){
    Future.delayed(Duration(seconds: 4),(){
      //Navigator.pushReplacementNamed(context, '/take_picture');
      getImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    goToTakePicture();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
