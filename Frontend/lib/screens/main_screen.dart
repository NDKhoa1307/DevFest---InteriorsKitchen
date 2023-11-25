import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gal/gal.dart';
import 'take_picture_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.firstCamera, super.key});
  final firstCamera;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  File? img;
  Future pickImg() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    await Gal.putImage(img!.path);
    setState(() {
      this.img = File(img.path);
    });
  }

  Future takeImg() async {
    final img = await ImagePicker().pickImage(source: ImageSource.camera);
    await Gal.putImage(img!.path);

    setState(() {
      this.img = File(img.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            // NOT IMPLEMENTED
            onPressed: () {},
            child: const Text(
              'Upload an image',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TakePictureScreen(
                    // Pass the automatically generated path to
                    // the DisplayPictureScreen widget.
                    camera: widget.firstCamera,
                  ),
                ),
              );
            },
            child: const Text(
              'Take your picture',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
