import 'package:dio/dio.dart';
import 'package:smart_app/helper/user_info.dart';
import 'package:smart_app/model/user_model.dart';
import '../model/surat_model.dart';

class User_services {
  Future<User_model> getDataFromSharedPref() async {
    var name = UserInfo().getNama();
    return User_model(nama: name.toString());
  }
}
