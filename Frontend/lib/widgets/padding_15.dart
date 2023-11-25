import 'package:flutter/material.dart';

class Padding10 extends StatelessWidget {
  const Padding10({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
    );
  }
}
