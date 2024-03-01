import 'package:bloc_test_app/presentation/pages/dialogs_page/menu_route.dart';
import 'package:bloc_test_app/presentation/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';

class DialogsPage extends StatelessWidget {
  //сделать,чтобы принимал id
  const DialogsPage({super.key, required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: Colors.grey,
        child: ListView(children: [
          const UserAccountsDrawerHeader(
            accountName: Text("blabla"),
            accountEmail: Text(""),
            margin: EdgeInsets.only(bottom: 0),
          ),
          const ListTile(
            title: Text("first"),
            trailing: Icon(Icons.safety_check),
          ),
          const ListTile(
            title: Text("second"),
            trailing: Icon(Icons.safety_check),
          ),
          const ListTile(
            title: Text("third"),
            trailing: Icon(Icons.safety_check),
          ),
          ListTile(
            title: const Text("Настройки"),
            trailing: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
