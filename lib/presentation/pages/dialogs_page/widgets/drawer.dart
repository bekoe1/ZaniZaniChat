import 'package:bloc_test_app/data/repo/dialogs_repo.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:flutter/material.dart';

import '../../settings_page/settings_page.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({
    super.key,
    required this.callback,
  });

  final DrawerCallback callback;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late String name;

  @override
  void initState() {
    widget.callback(true);
    super.initState();
    SetName();
  }

  void SetName() {
    SharedPrefsHelper.GetName().then((nameFromPrefs) {
      setState(() {
        name = nameFromPrefs ?? "";
      });
    });
  }

  @override
  void dispose() {
    widget.callback(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: Colors.white12,
      child: ListView(children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/accountInfo');
          },
          child: UserAccountsDrawerHeader(
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
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            accountEmail: null,
          ),
        ),
        GestureDetector(
          onTap: (){
              DialogsRepo.GetMyProfileInfo();
            // SharedPrefsHelper.GetAllData();
          },
          child: const ListTile(
            title: Text(
              "first",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.safety_check),
          ),
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
