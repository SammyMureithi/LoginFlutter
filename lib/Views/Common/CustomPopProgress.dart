import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPopProgressIndicator {
  Future<void> customPopProgressindicator(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 50,
            child: Row(
              children: [CircularProgressIndicator(), Text("  Please wait...")],
            ),
          ),
        );
      },
    );
  }
}
