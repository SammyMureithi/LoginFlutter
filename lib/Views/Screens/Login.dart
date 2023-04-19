// ignore_for_file: unused_element, prefer_const_constructors, sort_child_properties_last, unrelated_type_equality_checks, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:login/Utils/SharedPreference.dart';
import 'package:login/Views/Common/CustomPopProgress.dart';
import 'package:login/Views/Screens/HomeScreen.dart';
import '../Common/CustomButton.dart';
import '../Common/TextInputField.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common/Toast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = TextEditingController();
  final _myFieldFocusNode = FocusNode();
  bool _isLoading = false;
  late SharedPreferences preferences;

  Future<void> handleClick(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      //lets handle  our post request here

      var url = Uri.parse('http://192.168.8.115:8000/api/v1/auth/signin');
      try {
        _isLoading = true;
        {
          _isLoading
              ? CustomPopProgressIndicator().customPopProgressindicator(context)
              : null;
        }
        var response = await http.post(url, body: {
          'username': userController.text.trim(),
          'password': passwordController.text.trim()
        });
        Navigator.pop(context);
        _formKey.currentState!.save();
        _formKey.currentState!.reset();
        var responsebody = jsonDecode(response.body);
        if (responsebody["ok"] == true) {
          // print(responsebody);
          if (responsebody['user']['role'] == null) {
            return CustomToast(
                    message: "Role not Assigned", bgColor: Colors.red)
                .showToast();
          } else {
            try {
              preferences = await SharedPreferences.getInstance();
              await preferences.setInt("id", responsebody['user']['id']);
              await preferences.setString("name", responsebody['user']['name']);
              await preferences.setString(
                  "username", responsebody['user']['username']);
              await preferences.setString(
                  "phone", responsebody['user']['phone']);
              await preferences.setString(
                  "email", responsebody['user']['email']);
              await preferences.setString(
                  "role", responsebody['user']['role']['name']);
              await preferences.setString(
                  "accessToken", responsebody['accessToken']);
              // print("Saved Successfully");
              // var userId = await preferences.getString("role");
              // print(userId);
            } catch (e) {
              // print("Not Saved");
              print(e);
            }
          }

          CustomToast(message: responsebody['message'], bgColor: Colors.green)
              .showToast();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        } else {
          return CustomToast(
                  message: responsebody['message'], bgColor: Colors.red)
              .showToast();
        }
      } catch (e) {
        Navigator.pop(context);

        return CustomToast(message: "Network Error", bgColor: Colors.red)
            .showToast();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //will add the upper part
      Text("Upper part"),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 140),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: SizedBox(
            // height: double.negativeInfinity,
            width: double.infinity,
            child: Container(
              // margin: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30, top: 10),
                    child: Text(
                      "Log in to your Account",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 10, right: 20),
                    child: Text(
                        "Here's an example of how to display a row of text with one element aligned to the start"),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: TextInputFiled(
                                    controlerName: userController,
                                    labelText: "Username",
                                    keyBoardType: TextInputType.text,
                                    isTypePassword: false,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: TextInputFiled(
                                    controlerName: passwordController,
                                    labelText: "Password",
                                    keyBoardType: TextInputType.text,
                                    isTypePassword: true,
                                  ),
                                )
                              ],
                            )),
                        GestureDetector(
                            onTap: () => handleClick(context),
                            child: CustomButton(
                              textColor: Colors.white,
                              size: 25,
                              title: "SIGNIN",
                              img: Icons.arrow_forward,
                              color: const Color.fromARGB(255, 208, 0, 0),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Reset Password',
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 50),
                            child: CustomButton(
                              textColor: Colors.black,
                              size: 16,
                              title: "Create an Account",
                              color: Color.fromARGB(255, 163, 160, 160),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
