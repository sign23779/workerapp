// import 'dart:core';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextfieldContainer extends StatelessWidget {
  TextfieldContainer(
      {Key? key,
      this.Controller,
      this.hinttext,
      this.TrailingIcon,
      this.validator,
      this.initialValue,
      this.onTap,
      this.obscureText,
      this.errorText,
      this.keyboardType,
      this.leadingIcon,
      this.onChanged})
      : super(key: key);

  TextEditingController? Controller = TextEditingController();
  String? hinttext, errorText;
  Icon? leadingIcon;
  String? initialValue;
  TextInputType? keyboardType;
  IconButton? TrailingIcon;
  void Function()? onTap;
  bool? obscureText;

  // void OnChange;
  void Function(String)? onChanged;

  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      //300.sp,
      height: 55,
      decoration: BoxDecoration(
          color: const Color(0xffEEE9E9),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        leading: leadingIcon,
        title: TextFormField(
          obscureText: obscureText ?? false,
          onTap: onTap,
          initialValue: initialValue,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onChanged: onChanged,
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          controller: Controller,
          decoration: InputDecoration(
            errorText: errorText,
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        trailing: TrailingIcon,
      ),
    );
  }
}
