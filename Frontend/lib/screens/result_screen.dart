import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interiorschief/main.dart';
import 'package:interiorschief/screens/main_screen.dart';

class ResultScreen extends StatefulWidget {
  final String userPrompts;
  final String fileString;

  const ResultScreen({required this.userPrompts, required this.fileString, super.key});

  @override
  State<ResultScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ResultScreen> {
  void goBackToMain() {
    Navigator.popUntil(context, ModalRoute.withName('/Main'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            const Text('Some image should go here...'),
            ElevatedButton(
              onPressed: goBackToMain,
              child: const Text(
                'Go back',
                style: TextStyle(
                    fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
