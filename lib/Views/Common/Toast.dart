import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  final String message;
  final Color bgColor;
  CustomToast({required this.message, required this.bgColor});
  showToast() {
    return Fluttertoast.showToast(
        msg: message,
        backgroundColor: bgColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
