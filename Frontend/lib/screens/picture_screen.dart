import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/user_prompts.dart';

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String fileString = '';
  const DisplayPictureScreen({super.key, required this.imagePath});

  void convertToJson() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your room')),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.file(File(imagePath)), // Image here
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Tell us more about your room',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                UserPromts(imagePath: imagePath),
              ],
            )),
      ),
    );
  }
}
