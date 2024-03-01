import 'package:bloc_test_app/presentation/pages/dialogs_page/dialogs.page.dart';
import 'package:bloc_test_app/presentation/pages/login_page/login_page.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('Session');

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});

  final String? token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: token == null ? const AuthWidget() :  DialogsPage(token: token!));
  }
}
