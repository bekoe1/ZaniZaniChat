import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static final sessionName = "Session";
  static final userName = "Username";

  static Future<String?> GetSessionToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sessionName);
  }

  static Future<void> SetName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userName, value);
  }

  static Future<String?> GetName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName);
  }

  static Future<bool> IsSessionInStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(sessionName);
  }

  static Future<void> DeleteSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(sessionName);
  }

  static Future<void> SetSessionToken(String value) async {
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
