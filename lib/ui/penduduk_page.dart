import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Penduduk_Page extends StatefulWidget {
  const Penduduk_Page({super.key});

  @override
  State<Penduduk_Page> createState() => _Penduduk_PageState();
}

class _Penduduk_PageState extends State<Penduduk_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Daftar Penduduk"),
      ),
      body: ListView(
        children: [
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
          tetangga(),
        ],
      ),
    );
  }

  ListTile tetangga() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://pbs.twimg.com/profile_images/1588253672621969408/ieA3sRkN_400x400.jpg'),
      ),
      title: Text("Muhammad Jaja Royana"),
      subtitle: Text("Kp. Cijalu RT.04/RW.04 No.8 - Cikampek"),
      // trailing: Text("01.00 WIB"),
    );
  }
}
