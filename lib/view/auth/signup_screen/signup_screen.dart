import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nodusterworkerapp/common/const.dart';
import 'package:nodusterworkerapp/common/snackbar.dart';
import 'package:nodusterworkerapp/common/textfieldwidget.dart';
import 'package:nodusterworkerapp/functions/image_fun.dart';
import 'package:nodusterworkerapp/functions/user_auth.dart';
import 'package:nodusterworkerapp/model/user_model.dart';
import 'package:nodusterworkerapp/view/auth/login_screen/login_screen.dart';
import 'package:nodusterworkerapp/view/auth/widget/auth_button.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmpasswordController = TextEditingController();

  final _usernamecontroller = TextEditingController();

  final _addresscontroller = TextEditingController();

  final _phonenumbercontroller = TextEditingController();

  String imagurl = 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          //  padding: EdgeInsets.all(20),
          children: [
            k40height,
            k40height,
            //const Expanded(child: SizedBox()),

            Text(
              'Create An Account',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            k20height,
            Stack(
              children: [
                CircleAvatar(
                  radius: 75.0,
                  backgroundImage: NetworkImage(imagurl),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() async {
                        final imageurl =
                            await Images.getimage(ImageSource.gallery);
                        //image.add(imageurl.toString());
                        setState(() {});
                        imagurl = imageurl!;
                        log(imageurl.toString());
                      });
                      // do something
                    },
                  ),
                ),
              ],
            ),
            k20height,

            TextfieldContainer(
              Controller: _usernamecontroller,
              leadingIcon: const Icon(Icons.email),
              hinttext: 'Name',
            ),
            k20height,
            TextfieldContainer(
              Controller: _emailController,
              leadingIcon: const Icon(Icons.email),
              hinttext: 'Email',
            ),
            k20height,
            TextfieldContainer(
              Controller: _phonenumbercontroller,
              leadingIcon: const Icon(Icons.email),
              hinttext: 'Phone number',
            ),
            k20height,

            TextfieldContainer(
              obscureText: true,
              Controller: _passwordController,
              leadingIcon: const Icon(Icons.email),
              hinttext: 'Password',
            ),
            k20height,
            TextfieldContainer(
              obscureText: true,
              Controller: _confirmpasswordController,
              leadingIcon: const Icon(Icons.lock),
              hinttext: 'Confirm Password',
            ),
            k20height,
            TextfieldContainer(
              Controller: _addresscontroller,
              leadingIcon: const Icon(Icons.lock),
              hinttext: 'Address',
            ),

            k20height,
            AuthbuttonWidget(
                title: 'Sign Up',
                onTap: () async {
                  if (_usernamecontroller.text.isEmpty ||
                      _emailController.text.isEmpty ||
                      _passwordController.text.isEmpty ||
                      _confirmpasswordController.text.isEmpty ||
                      _phonenumbercontroller.text.isEmpty ||
                      _addresscontroller.text.isEmpty) {
                    //
                    Utils.showSnackBar(
                        context: context, text: 'Please fill all fields');
                  } else {
                    final passlength = _passwordController.text.trim().length;
                    passlength >= 6
                        ? _passwordController.text ==
                                _confirmpasswordController.text
                            ? await UserAuth.signUp(
                                user: UserModel(
                                    datetime: DateTime.now().toString(),
                                    image: imagurl,
                                    phonenumber: _phonenumbercontroller.text,
                                    username: _usernamecontroller.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    address: _addresscontroller.text,
                                    docname: _emailController.text),
                                context: context)
                            : Utils.showSnackBar(
                                context: context,
                                text: 'password doesnot match')
                        : Utils.showSnackBar(
                            context: context,
                            text: 'password Should be atleast 6 Characters');
                  }
                }),
            k20height,
            k10height,
            k40height,
            GestureDetector(
              onTap: () => Get.off(LoginScreen()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ? ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: purplecolor),
                  ),
                ],
              ),
            ),
            k40height
          ],
        ),
      )),
    );
  }
}
