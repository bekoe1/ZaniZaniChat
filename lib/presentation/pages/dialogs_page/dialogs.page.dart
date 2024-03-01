import 'package:flutter/material.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Placeholder(
          color: Colors.red,
        ),
      ),
    );
  }
}
