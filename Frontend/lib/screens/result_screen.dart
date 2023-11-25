import 'package:flutter/material.dart';

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
    );
  }
}
