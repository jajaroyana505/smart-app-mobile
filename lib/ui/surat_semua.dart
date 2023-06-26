import 'package:flutter/material.dart';
import '../model/surat_model.dart';
import '../services/surat_service.dart';
import './surat_item.dart';

class Semua_surat extends StatelessWidget {
  const Semua_surat({super.key});
  Stream<List<Surat_Model>> dataSurat() async* {
    List<Surat_Model> data = await Surat_services().dataSurat();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dataSurat(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Text('Data Kosong');
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return surat_Item(surat: snapshot.data[index]);
          },
        );
      },
    );
  }
}
