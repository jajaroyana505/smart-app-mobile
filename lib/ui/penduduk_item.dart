import 'package:flutter/material.dart';
import '../model/penduduk_model.dart';

class penduduk_Item extends StatelessWidget {
  final Penduduk_Model penduduk;
  const penduduk_Item({super.key, required this.penduduk});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('${penduduk.foto}'),
        ),
        title: Text("${penduduk.nama}"),
        subtitle: Text("${penduduk.alamat}"),
      ),
    );
  }
}
