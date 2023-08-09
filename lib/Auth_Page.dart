import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/Login_Screen.dart';
import 'package:project1/Home_Screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              ///user is log in
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              else if(snapshot.hasData){
                return HomeScreen();
              }
              else if(snapshot.hasError){
                return Center(child: Text('Something went wrong!'));
              }
              else{
                return LoginScreen();
              }

              ///user is not log in

            },
          )
      ),
    );
  }
}