import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/Home_Screen.dart';
import 'package:project1/Home_Screen1.dart';
import 'package:project1/Login_Screen.dart';
import 'package:project1/User_Preferences.dart';

class ManageLoginScreen extends StatefulWidget {
  @override
  _ManageLoginScreenState createState() => _ManageLoginScreenState();
}

class _ManageLoginScreenState extends State<ManageLoginScreen> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    bool isLoggedIn = await UserPreferences.isLoggedIn();
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: _isLoggedIn ? '/home' : '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen1(),
      },
    );
  }
}