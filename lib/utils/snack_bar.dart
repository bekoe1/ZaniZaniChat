import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.mainColor});

  final String text;
  final Color backgroundColor;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        text,
        style: TextStyle(color: mainColor),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
