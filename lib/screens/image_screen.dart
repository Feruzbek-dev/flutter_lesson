import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
              'assets/photo_2024-09-05_14.18.54__1_-removebg-preview.png',),
          SizedBox(height: 30,),
          Image.asset('assets/images/Ресурс 1 5.png')
        ],
      ),
    );
  }
}
