// ignore_for_file: unused_element, prefer_const_constructors, sort_child_properties_last

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../Common/TextInputField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = TextEditingController();
  Widget _usernameinputFiled() {
    return SizedBox(
      height: 50,
      width: 300,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Username",
          labelStyle: TextStyle(color: Colors.green, fontSize: 10.0),
          border: OutlineInputBorder(),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        controller: _usernameController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter Username";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Future<void> handleClick() async {
    if (_formKey.currentState!.validate()) {
      //lets handle  our post request here
      var url = Uri.parse('http://127.0.0.1:8000/api/v1/auth/signin');
      var response = await http.post(url, body: {
        'username': userController.text,
        'password': passwordController.text
      });
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        if (responsebody["status"] == true) {
          Fluttertoast.showToast(
              msg: "Success",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: "Invalid Username or Password",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Failed",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      print("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Form(
              child: Column(children: [
                TextInputFiled(
                  controlerName: userController,
                  labelText: "Username",
                  keyBoardType: TextInputType.text,
                  isTypePassword: false,
                ),
                TextInputFiled(
                  controlerName: passwordController,
                  labelText: "Password",
                  keyBoardType: TextInputType.text,
                  isTypePassword: true,
                )
              ]),
              key: _formKey,
            ),
            GestureDetector(
              onTap: handleClick,
              child: ElevatedButton(
                child: Text("Login"),
                onPressed: () => handleClick(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
