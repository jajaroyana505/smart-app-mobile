import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = "";
const String USER_ID = "userID";
const String USERNAME = "MUHMMAD JAJA ROYANA";
const String NIK = "3213050403010000";

class UserInfo {
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(TOKEN, value);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TOKEN);
  }

  Future setUserID(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(USER_ID, value);
  }

  Future<String> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USER_ID).toString();
  }

  Future setUsername(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(USERNAME, value);
  }

  Future<String> getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USERNAME).toString();
  }

  Future<String> getNik() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(NIK).toString();
  }

  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
