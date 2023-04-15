// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextInputFiled extends StatelessWidget {
  const TextInputFiled(
      {super.key,
      required this.controlerName,
      required this.labelText,
      required this.keyBoardType,
      required this.isTypePassword});
  final TextEditingController controlerName;
  final String labelText;
  final TextInputType keyBoardType;
  final bool isTypePassword;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.green, fontSize: 10.0),
          border: OutlineInputBorder(),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: keyBoardType,
        controller: controlerName,
        obscureText: isTypePassword,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter ${labelText}";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
