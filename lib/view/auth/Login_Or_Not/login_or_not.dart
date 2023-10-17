import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nodusterworkerapp/view/auth/login_screen/login_screen.dart';
import 'package:nodusterworkerapp/view/home_screen/home_screen.dart';

class LoginOrNot extends StatelessWidget {
  const LoginOrNot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.black,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Somthing went wrong',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return LoginScreen();
          }
        });
  }
}
