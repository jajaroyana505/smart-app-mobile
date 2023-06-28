import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = "token";
const String NIK = "nik";
const String NAMA = "nama";
const String ALAMAT = "alamat";

class UserInfo {
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(TOKEN, value);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TOKEN);
  }

  Future setNama(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(NAMA, value);
  }

  Future<String> getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(NAMA) ?? "Tidak ada data";
  }

  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
