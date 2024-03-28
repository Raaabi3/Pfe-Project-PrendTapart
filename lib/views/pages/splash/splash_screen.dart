import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://i.pinimg.com/originals/de/dc/25/dedc25f0ffe2622c2ab7f325ea2bc9f2.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
