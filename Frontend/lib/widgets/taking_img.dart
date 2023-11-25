import 'package:flutter/material.dart';
import 'package:interiorschief/widgets/padding_15.dart';

class GetImgButtons extends StatelessWidget {
  final VoidCallback pickImg;
  final VoidCallback takeImg;
  GetImgButtons({required this.pickImg, required this.takeImg, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: pickImg,
            child: const Text(
              'Upload an image',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Padding10(),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: takeImg,
            child: const Text(
              'Take a picture',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
