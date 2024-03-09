import 'dart:developer';

import 'package:bloc_test_app/presentation/pages/current_dialog_page/current_dialog_page.dart';
import 'package:bloc_test_app/presentation/pages/dialogs_page/bloc/dialogs_bloc.dart';
import 'package:bloc_test_app/presentation/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DialogsPage extends StatefulWidget {
  //сделать,чтобы принимал id
  const DialogsPage({super.key, required this.token});

  final String token;

  @override
  State<DialogsPage> createState() => _DialogsPageState();
}

class _DialogsPageState extends State<DialogsPage> {
  List<String> chats = ["", "", "", "", "", ""];

  @override
  void initState() {
    //final bloc = BlocProvider.of<DialogsBloc>(context);
    //bloc.add(ConnectionToServerEvent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
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
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> CurrentDialog()));
                  },
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            setState(() {
                              chats.removeAt(index);
                            });
                          },
                          //todo
                          icon: Icons.delete,
                          spacing: 1,
                          autoClose: true,
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 50,
                        child: Placeholder(
                          color: Colors.red,
                          //test
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
