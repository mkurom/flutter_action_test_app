import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_action_test_app/camera/camera.dart';
import 'package:flutter_action_test_app/image_picker/image_pick.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  final firstCamera = cameras.first;

  // runApp(MyHomePage());

  runApp(MyApp(
    firstCamera: firstCamera,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.firstCamera,
  });

  final CameraDescription firstCamera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TakePictureScreen(
        camera: firstCamera,
      ),

      // home: ImagePick(),
    );
  }
}
