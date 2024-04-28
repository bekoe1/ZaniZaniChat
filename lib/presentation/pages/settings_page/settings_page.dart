import 'package:bloc_test_app/data/datasources/auth_data_source.dart';
import 'package:bloc_test_app/utils/buttons.dart';
import 'package:flutter/material.dart';

import '../../../domain/repo/web_socket_repo.dart';

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
            AuthDataSource().logOut();
          },
          text: "LogOut",
          textColor: Colors.red,
        ),
      ),
    );
  }
}
