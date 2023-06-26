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

  Future<List<Surat_Model>> dataSurat() async {
    final Response response = await ApiClient().get('Surat');
    final List data = response.data as List;
    List<Surat_Model> result =
        data.map((json) => Surat_Model.fromJson(json)).toList();
    // print(result);
    return result;
  }
}
