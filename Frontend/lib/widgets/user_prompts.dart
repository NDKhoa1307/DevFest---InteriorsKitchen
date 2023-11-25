import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:interiorschief/screens/result_screen.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class UserPromts extends StatefulWidget {
  final File image;
  final TextEditingController textController;
  String? message;
  int count = 0;
  final VoidCallback uploadImgAndPrompts;
  UserPromts(
      {required this.count,
      this.message,
      required this.textController,
      required this.image,
      required this.uploadImgAndPrompts});

  @override
  State<UserPromts> createState() => _UserPromtsState();
}

class _UserPromtsState extends State<UserPromts> {
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
            controller: widget.textController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              onPressed: widget.uploadImgAndPrompts,
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
