import 'package:flutter/material.dart';
import 'package:interiorschief/screens/result_screen.dart';

class UserPromts extends StatefulWidget {
  final String imagePath;
  const UserPromts({required this.imagePath, super.key});

  @override
  State<UserPromts> createState() => _UserPromtsState();
}

class _UserPromtsState extends State<UserPromts> {
  final textController = TextEditingController();
  String userPrompt = 'default value';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      userPrompts: userPrompt,
                      fileString: widget.imagePath,
                    ),
                  ),
                );
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
