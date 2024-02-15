import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const text = 'Movie';
    return const Column(
      children: [
        Center(child: Text(text, style: TextStyle(),),)
      ],
    );
  }
}
