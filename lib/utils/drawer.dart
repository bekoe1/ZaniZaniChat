
import 'package:flutter/material.dart';

import '../presentation/pages/settings_page/settings_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key, required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.grey,
      child: ListView(children: [
        UserAccountsDrawerHeader(
          accountName: Text(name, style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),),
          accountEmail: const Text(""),
          margin: const EdgeInsets.only(bottom: 0),
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
    );
  }
}