import '../helper/user_info.dart';

class LoginService {
  Future<bool> login(String nik, String password) async {
    bool isLogin = false;
    if (nik == '3213050403010000' && password == 'jaja123') {
      await UserInfo().setToken("1");
      await UserInfo().setNama("Jaja Royana");
      isLogin = true;
    }
    return isLogin;
  }
}
