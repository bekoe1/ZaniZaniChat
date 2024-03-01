import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
        required this.text,
        required this.func,
        required this.bckgroundColor,
        required this.textColor, required this.fontSize});

  final String text;
  final void Function() func;
  final Color bckgroundColor;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bckgroundColor,
      ),
      onPressed: func,
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}