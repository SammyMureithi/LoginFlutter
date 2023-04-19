// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login/Utils/SharedPreference.dart';
import 'package:login/Utils/SharedPreference.dart';
import 'package:login/Views/Screens/AddExpensesScreen.dart';
import 'package:login/Views/Screens/UnconfirmedExpenses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var _userId;
  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = await prefs.getInt("id") ?? 0;
    return userId;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Column(
        children: [
          ElevatedButton(
            child: Text("Add Expenses"),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddExpenses(),
                )),
          ),
          ElevatedButton(
            child: Text("UnconfirmedExpenses Expenses"),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UnconfirmedExpenses(),
                )),
          ),
        ],
      ),
    ));
  }
}
