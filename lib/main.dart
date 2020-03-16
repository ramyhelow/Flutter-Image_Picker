import 'package:flutter/material.dart';
import 'package:imagepicker/pages/loading_screen.dart';
import 'package:imagepicker/pages/take_picture.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => LoadingScreen(),
    '/take_picture': (context) => TakePicture(),
  },
));

