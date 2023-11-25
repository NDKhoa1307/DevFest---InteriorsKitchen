import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:interiorschief/screens/result_screen.dart';
import 'package:http/http.dart' as http;

class UserPromts extends StatefulWidget {
  final File image;
  const UserPromts({required this.image, super.key});

  @override
  State<UserPromts> createState() => _UserPromtsState();
}

class _UserPromtsState extends State<UserPromts> {
  final textController = TextEditingController();
  String? message;
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  uploadImage() async {
    try {
      final request =
          http.MultipartRequest("POST", Uri.parse("http://10.0.2.2:5000/upload"));
      var stream = http.ByteStream(widget.image.openRead());
      var length = await widget.image.length();

      var multipartFile = http.MultipartFile('image', stream, length,
          filename: widget.image.path.split("/").last);

      request.files.add(multipartFile);

      var response = await request.send();
      if (response.statusCode == 200) {
        print("Image uploaded successfully");
      } else {
        print("Error uploading image. Status code: ${response.statusCode}");
      }
      setState(() {});
    } catch (e) {
      print('!!!! Error: $e');
    } finally {
      Navigator.of(context).push(
        MaterialPageRoute(
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
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(labelText: 'Type here:'),
            controller: textController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              onPressed: () {
                uploadImage();
              },
              child: const Text(
                'Sumbit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
