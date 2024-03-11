import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static final sessionName = "Session";

  static Future<String?> GetSessionToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sessionName);
  }

  static Future<bool> IsSessionInStorage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(sessionName);
  }
  static Future<void> DeleteSession() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(sessionName);
  }

  static Future<void> SetSessionToken(String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sessionName, value);
  }
}
