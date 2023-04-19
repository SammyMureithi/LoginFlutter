import 'package:flutter/material.dart';

class UnconfirmedExpenses extends StatelessWidget {
  const UnconfirmedExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unconfirmed Expenses')),
      body: SafeArea(child: Center(child: Text('Unconfirmed Expenses'))),
    );
  }
}
