import 'package:flutter/material.dart';
import 'package:project1/Auth_Page.dart';
import 'package:project1/Google_Sign_in.dart';
import 'package:project1/Home_Screen.dart';
import 'package:project1/Home_Screen.dart';
import 'package:project1/Login_Screen.dart';
import 'package:project1/Manage_Login_Status.dart';
import 'package:project1/Profile_Screen.dart';
import 'package:project1/Register_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/User_List_Screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ManageLoginScreen(),
      ),
    );
  }
}