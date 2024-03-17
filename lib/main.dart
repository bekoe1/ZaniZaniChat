import 'dart:developer';

import 'package:bloc_test_app/presentation/pages/dialogs_page/dialogs.page.dart';
import 'package:bloc_test_app/presentation/pages/login_page/login_page.dart';
import 'package:bloc_test_app/presentation/pages/my_account_page/my_account_page.dart';
import 'package:bloc_test_app/presentation/pages/sign_in_page/sign_in_page.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await SharedPrefsHelper.GetSessionToken();
  final bool tk = await SharedPrefsHelper.IsSessionInStorage();
  if(tk == true) {
    log("da");
  } else {
    log("net");
  }
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});
  final String? token;

  @override
  Widget build(BuildContext context) {
    log(token ?? "no data");
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/sign_in': (context) => const SignInPage(),
          '/log_in': (context) => const LogInPage(),
          '/dialogs' : (context) =>  const DialogsPage(),
          '/accountInfo' : (context) => const MyAccountPage(),
        },
        home: token == null ? const LogInPage() : DialogsPage());
       //home: DialogsPage());
  }
}
