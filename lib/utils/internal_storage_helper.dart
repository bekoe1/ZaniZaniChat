import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const sessionName = "Session";
  static const userName = "username";
  static const myId = "myId";

  static Future<String?> getSessionToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sessionName);
  }

  static Future<void> setName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userName, value);
  }

  static Future<String?> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString(myId);
    log(id.toString());
    return id;
  }

  static Future<void> setID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(myId, id);
  }

  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName);
  }
  static Future<void> deleteName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(userName);
  }
  static Future<bool> isSessionInStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(sessionName);
  }

  static Future<void> deleteSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(sessionName);
  }

  static Future<void> deleteMyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(myId);
  }
  static Future<void> setSessionToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sessionName, value);
  }

  static Future<void> GetAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> allKeys = prefs.getKeys().toList();
    for (var element in allKeys) {
      log(
        "key: $element \n value: ${prefs.getString(element).toString()}\n",
      );
      // prefs.remove(element);
    }
  }
}
