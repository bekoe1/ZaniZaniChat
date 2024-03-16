import 'package:flutter/material.dart';

import '../../settings_page/settings_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.white12,
      child: ListView(children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.grey,
            gradient: LinearGradient(colors: [
              Colors.black,
              Colors.black12,
              Colors.white54,
              Colors.white12
            ], begin: Alignment.bottomLeft),
          ),
          accountName: Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          accountEmail: const Text(""),
          margin: const EdgeInsets.only(bottom: 0),
        ),
        const ListTile(
          title: Text(
            "first",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(Icons.safety_check),
        ),
        const ListTile(
          title: Text(
            "second",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(Icons.safety_check),
        ),
        const ListTile(
          title: Text(
            "third",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(Icons.safety_check),
        ),
        ListTile(
          title: const Text(
            "Настройки",
            style: TextStyle(color: Colors.white),
          ),
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
