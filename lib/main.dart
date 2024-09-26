import 'package:exercise/screens/auth/login_screen.dart';
import 'package:exercise/screens/auth/new_login.dart';
import 'package:exercise/screens/home_screen.dart';
import 'package:exercise/screens/products/products_screen.dart';
import 'package:exercise/screens/responsive_screen.dart';
import 'package:flutter/material.dart';

import 'screens/image_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Auvich",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ResponsiveScreen(),
    );
  }
}

