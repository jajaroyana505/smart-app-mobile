import 'package:flutter/material.dart';
import 'package:smart_app/services/penduduk_service.dart';
import '../model/penduduk_model.dart';
import './penduduk_item.dart';

class Penduduk_Page extends StatefulWidget {
  const Penduduk_Page({super.key});

  @override
  State<Penduduk_Page> createState() => _Penduduk_PageState();
}

class _Penduduk_PageState extends State<Penduduk_Page> {
  Stream<List<Penduduk_Model>> getList() async* {
    List<Penduduk_Model> data = await Penduduk_services().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Daftar Penduduk"),
        ),
        body: StreamBuilder(
          stream: getList(),
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
                return penduduk_Item(penduduk: snapshot.data[index]);
              },
            );
          },
        ));
  }
}
