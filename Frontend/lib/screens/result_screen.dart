import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResultScreen extends StatefulWidget {
  final String userPrompts;
  final String fileString;

  const ResultScreen({required this.userPrompts, required this.fileString, super.key});

  @override
  State<ResultScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Column(
        children: <Widget>[
          Text('This is filePath: ${widget.fileString}'),
          Text('This is userPromts: ${widget.userPrompts}'),
        ],
      ),
    );
  }
}
