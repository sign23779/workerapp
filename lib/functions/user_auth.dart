import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nodusterworkerapp/common/snackbar.dart';
import 'package:nodusterworkerapp/model/user_model.dart';
import 'package:nodusterworkerapp/view/auth/login_screen/login_screen.dart';
import 'package:nodusterworkerapp/view/home_screen/home_screen.dart';

class UserAuth {
  static Future signUp({required UserModel user, required context}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final workerdetails =
          FirebaseFirestore.instance.collection('workers').doc(user.email);

      final workerdetailsjson = user.toJson();
      await workerdetails.set(workerdetailsjson);

      log('new user created n added to databse');
      Get.off(LoginScreen());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(context: context, text: 'Invalid Email id');
      log(e.toString());
    }
  }

  static Future login({required UserModel usermodel, required context}) async {
    UserCredential user;

    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usermodel.email, password: usermodel.password)
          .then((value) => {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ))
              });

      return user;
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(context: context, text: 'Enter Valid Email/Password');

      log(e.toString());
    }
  }
}
