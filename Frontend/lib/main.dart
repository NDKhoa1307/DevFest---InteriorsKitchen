import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interiorschief/screens/main_screen.dart';
import 'package:interiorschief/widgets/padding_15.dart';
import 'package:interiorschief/widgets/taking_img.dart';

import 'screens/picture_screen.dart';
import 'screens/take_picture_screen.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({this.img, super.key});
  File? img;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        img: img,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.img, super.key});
  File? img;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future pickImg() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    // Gia su ko luu
    setState(() {
      widget.img = File(img!.path);
    });

    // setState(() {
    //   widget.img = File(img!.path);
    // });
    // print('Img path: ${widget.img}');
  }

  Future takeImg() async {
    final img = await ImagePicker().pickImage(source: ImageSource.camera);
    // What if ko luu
    setState(() {
      widget.img = File(img!.path);
    });
    // await Gal.putImage(img!.path);
    // setState(() {
    //   widget.img = File(img.path);
    // });
    // print('Img path: ${widget.img}');
  }

  void forwardToPictureScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(
          image: widget.img!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('I am doomed as frick'), backgroundColor: Colors.amberAccent),
      body: Container(
        width: double.infinity,
        child: widget.img == null
            ? GetImgButtons(
                pickImg: pickImg,
                takeImg: takeImg,
              )
            : Column(
                children: [
                  Image.file(widget.img!),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: forwardToPictureScreen,
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 5)),
                  const Text('Or choose another one'),
                  const Padding(padding: EdgeInsets.only(bottom: 5)),
                  GetImgButtons(
                    pickImg: pickImg,
                    takeImg: takeImg,
                  )
                ],
              ),
      ),
    );
  }
}
