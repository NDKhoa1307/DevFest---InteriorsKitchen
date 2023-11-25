import 'package:flutter/material.dart';

import 'take_picture_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({required this.firstCamera, super.key});
  final firstCamera;

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
                    camera: firstCamera,
                  ),
                ),
              );
              // TakePictureScreen(
              //   // Pass the appropriate camera to the TakePictureScreen widget.
              //   camera: firstCamera,
              // );
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
