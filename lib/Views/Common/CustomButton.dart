import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.img,
    required this.color,
    required this.size,
    required this.textColor,
  }) : super(key: key);

  final String title;
  final IconData? img;
  final Color color;
  final Color textColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: const EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: size,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          img != null ? Icon(img, color: Colors.white) : SizedBox(),
        ],
      ),
    );
  }
}
