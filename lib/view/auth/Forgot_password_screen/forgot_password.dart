import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nodusterworkerapp/common/const.dart';
import 'package:nodusterworkerapp/common/snackbar.dart';
import 'package:nodusterworkerapp/common/textfieldwidget.dart';
import 'package:nodusterworkerapp/view/auth/login_screen/login_screen.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({Key? key}) : super(key: key);

  final emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purplecolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 250.w,
            //   height: 100.h,
            //   decoration: const BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage(
            //               'asset/app_icon/lace-it-high-resolution-logo-white-on-transparent-background (1).png'),
            //           fit: BoxFit.contain)),
            // ),
            // k10height,
            Text(
              'Reset the Password',
              style: TextStyle(
                  color: whitecolor, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            k20height,
            TextfieldContainer(
              Controller: emailcontroller,
              hinttext: 'Email',
              leadingIcon: const Icon(
                Icons.email,
                color: Colors.grey,
                size: 20,
              ),
            ),
            k20height,
            GestureDetector(
              onTap: () {
                resetPass(context);
              },
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: whitecolor, borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            k20height,
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Sign In",
                    style: TextStyle(
                        color: whitecolor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future resetPass(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: whitecolor,
          backgroundColor: purplecolor,
        ),
      ),
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      log('Code send to $emailcontroller');

      Utils.showSnackBar(
          text: 'Password reset email send to your ${emailcontroller.text}',
          color: whitecolor,
          context: context);
    } on FirebaseAuthException catch (e) {
      log('Reset exp $e');
      Utils.showSnackBar(context: context, text: e.message);
    }
    Get.offAll(LoginScreen());
  }
}
