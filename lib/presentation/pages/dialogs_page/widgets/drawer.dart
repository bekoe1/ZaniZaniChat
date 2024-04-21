import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
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
  String name = "";

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
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Image.network(
                  OtherConstants.accountCircle,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            decoration:
                const BoxDecoration(color: Color.fromRGBO(46, 45, 49, 1)),
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
          onTap: () {
            // DialogsRepo.GetMyProfileInfo();
            // SharedPrefsHelper.GetAllData();
            //WebSocketHelper().setProfile(id: 1);
            //  WebSocketHelper().close();
            //WebSocketHelper().connect();
            //  WebSocketHelper().add();
            // Navigator.push(
            //   context,
            //   // MaterialPageRoute(builder: (context) => TestPage()),
            // );
            //WebSocketHelper().SendMessage();
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
