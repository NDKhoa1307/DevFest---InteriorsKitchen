import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interiorschief/screens/main_screen.dart';

import 'screens/take_picture_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp(firstCamera: firstCamera));
}

class MyApp extends StatelessWidget {
  final firstCamera;
  const MyApp({required this.firstCamera, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        firstCamera: firstCamera,
      ),
      // TakePictureScreen(
      //   // Pass the appropriate camera to the TakePictureScreen widget.
      //   camera: firstCamera,
      // );
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.firstCamera, super.key});
  final firstCamera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('I am doomed as frick'), backgroundColor: Colors.amberAccent),
      body: MainScreen(
        firstCamera: firstCamera,
      ),
    );
  }
}
