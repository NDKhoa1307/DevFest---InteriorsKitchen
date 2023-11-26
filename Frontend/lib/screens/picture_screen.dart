// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../widgets/user_prompts.dart';
import 'result_screen.dart';
import 'package:http/http.dart' as http;

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatefulWidget {
  final File image;
  const DisplayPictureScreen({super.key, required this.image});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final textController = TextEditingController();
  String? message;
  int count = 0;
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  uploadImgAndPrompts() async {
    try {
      final request =
          http.MultipartRequest("POST", Uri.parse("http://10.0.2.2:5000/upload"));
      var stream = http.ByteStream(widget.image.openRead());
      var length = await widget.image.length();

      var multipartFile =
          http.MultipartFile('image', stream, length, filename: '00$count.jpg');
      request.files.add(multipartFile);

      // Get the app's local directory
      Directory appDocDir = await getApplicationDocumentsDirectory();

      // Create a temporary text file in the app's local directory
      File txtFile = File('${appDocDir.path}/temp_data.txt');
      await txtFile.writeAsString(textController.text);
      // Add text file
      var txtStream = http.ByteStream(txtFile.openRead());
      var txtLength = await txtFile.length();
      var txtMultipartFile = http.MultipartFile(
        'txt',
        txtStream,
        txtLength,
        filename: '00$count.txt',
      );
      request.files.add(txtMultipartFile);

      var response = await request.send();
      if (response.statusCode == 200) {
        print("Image uploaded successfully");
      } else {
        print(
            "Error uploading image. Status code: ${response.statusCode}, ${response.headers}");
      }
      setState(() {
        count++;
      });
    } catch (e) {
      print('!!!! Error: $e');
    } finally {
      Navigator.of(context).push(
        MaterialPageRoute(
          settings: RouteSettings(name: '/Display'),
          builder: (context) => ResultScreen(
            userPrompts: textController.text,
            fileString: widget.image.path,
          ),
        ),
      );
    }
  }

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
              Image.file(widget.image), // Image (In file format) here
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Describe the design type and room type',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              UserPromts(
                image: widget.image,
                count: count,
                textController: textController,
                uploadImgAndPrompts: uploadImgAndPrompts,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
