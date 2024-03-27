import 'package:bloc_test_app/data/repo/auth_repo.dart';
import 'package:bloc_test_app/data/repo/web_socket_repo.dart';
import 'package:bloc_test_app/utils/buttons.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: CustomElevatedButton(
          bckgroundColor: Colors.white,
          fontSize: 22,
          func: (){
            WebSocketRepo().disconnect();
            AuthRepository.logOut();
          },
          text: "LogOut",
          textColor: Colors.red,
        ),
      ),
    );
  }
}
