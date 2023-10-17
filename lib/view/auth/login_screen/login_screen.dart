import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nodusterworkerapp/common/const.dart';
import 'package:nodusterworkerapp/common/textfieldwidget.dart';
import 'package:nodusterworkerapp/functions/user_auth.dart';
import 'package:nodusterworkerapp/model/user_model.dart';
import 'package:nodusterworkerapp/view/auth/Forgot_password_screen/forgot_password.dart';
import 'package:nodusterworkerapp/view/auth/widget/auth_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login To Your Account',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: purplecolor),
              ),
              k40height,
              TextfieldContainer(
                Controller: _emailController,
                leadingIcon: const Icon(Icons.email),
                hinttext: 'Email',
              ),
              k20height,
              TextfieldContainer(
                obscureText: true,
                Controller: _passwordController,
                leadingIcon: const Icon(Icons.lock),
                hinttext: 'Password',
              ),
              k20height,
              AuthbuttonWidget(
                  title: 'SignIn',
                  onTap: () async {
                    await UserAuth.login(
                        usermodel: UserModel(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                        context: context);
                  }),
              k20height,
              k10height,
              Text(
                "Don't have an account, Contact us ",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.grey),
              ),
              k10height,
              Text(
                "0431-4439959",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: purplecolor),
              ),
              k20height,
              GestureDetector(
                onTap: () {
                  Get.off(ForgotScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      '  Click here!',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: purplecolor),
                    ),
                  ],
                ),
              ),
              k20height,
            ],
          ),
        ),
      ),
    );
  }
}
