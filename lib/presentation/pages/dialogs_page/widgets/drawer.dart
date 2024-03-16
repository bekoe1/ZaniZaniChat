import 'package:flutter/material.dart';

import '../../settings_page/settings_page.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
    required this.name,
    required this.callback,
  });

  final String name;
  final DrawerCallback callback;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    widget.callback(true);

    super.initState();
  }

  @override
  void dispose() {
    widget.callback(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.white12,
      child: ListView(children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: const CircleAvatar(
            backgroundColor: Colors.white54,
            maxRadius: 50,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black12,
                Colors.white10,
                Colors.white12,
                Colors.white54,
                Colors.white70,
              ],
            ),
          ),
          accountName: Text(
            widget.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          accountEmail: const Text(""),
        ),
        const ListTile(
          title: Text(
            "first",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          trailing: Icon(Icons.safety_check),
        ),
        const ListTile(
          title: Text(
            "second",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          trailing: Icon(Icons.safety_check),
        ),
        const ListTile(
          title: Text(
            "third",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          trailing: Icon(Icons.safety_check),
        ),
        ListTile(
          title: const Text(
            "Настройки",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
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
