import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthbuttonWidget extends StatelessWidget {
  AuthbuttonWidget({Key? key, required this.title, required this.onTap})
      : super(key: key);

  String title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
