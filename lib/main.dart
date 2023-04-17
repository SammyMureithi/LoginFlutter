// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'Views/Screens/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.fromARGB(255, 208, 0, 0),
              child: Center(child: LoginPage())),
        ),
      ),
    );
  }
}
