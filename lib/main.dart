import 'package:flutter/material.dart';
import 'package:project1/Home_Screen.dart';
import 'package:project1/Home_Screen.dart';
import 'package:project1/Login_Screen.dart';
import 'package:project1/Profile_Screen.dart';
import 'package:project1/Register_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

