import 'package:dio/dio.dart';
import '../helper/api_client.dart';
import '../model/surat_model.dart';

class Surat_services {
  Future<Surat_Model> simpan(Surat_Model surat) async {
    var data = surat.toJson();
    final Response response = await ApiClient().post('Surat', data);
    Surat_Model result = Surat_Model.fromJson(response.data);
    return result;
  }
}
//   Future<Poli> simpan(Poli poli) async {
//     var data = poli.toJson();
//     final Response response = await ApiClient().post('poli', data);
//     Poli result = Poli.fromJson(response.data);
//     return result;
//   }