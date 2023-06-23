import 'package:flutter/material.dart';
import 'package:smart_app/ui/penduduk_page.dart';
import 'package:smart_app/ui/surat_page.dart';

import 'sidebar.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    final shadow = [
      BoxShadow(
        color: Color.fromARGB(31, 85, 85, 85),
        offset: const Offset(0, 2.0),
        blurRadius: 1.0,
        spreadRadius: 3.0,
      ), //BoxShadow
      BoxShadow(
        color: Colors.white,
        offset: const Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ];
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
          // title: Text("Home Page"),
          ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ListTile(
            title: Text("Muhammad Jaja Royana",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                )),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2017/06/18/18/01/potrait-2416628_1280.jpg'),
            ),
            subtitle: Row(children: [
              Icon(
                Icons.fmd_good,
                size: 14,
              ),
              Text("Dusun Cijalu, RT.02/04", style: TextStyle(fontSize: 12))
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              "Selamat Datang...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          hero(widthApp, shadow),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "Pelayanan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Penduduk_Page();
                  }));
                },
                child: Container(
                  width: widthApp * 0.4,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    boxShadow: shadow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 80,
                            child: Text(
                              "Daftar Penduduk",
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            )),
                        Icon(
                          Icons.people,
                          size: 50,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Surat_page();
                  }));
                },
                child: Container(
                  width: widthApp * 0.4,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: shadow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 80,
                            child: Text(
                              "Pengajuan Surat",
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            )),
                        Icon(
                          Icons.file_copy,
                          size: 50,
                          color: Colors.black26,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container hero(double widthApp, List<BoxShadow> shadow) {
    return Container(
      width: widthApp * 0.9,
      height: 200,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          // image: new AssetImage("images/foto.jpg"),
          image: NetworkImage(
              "https://aminjaya.desa.id/asset/foto_statis/WEB.JPG"),
          // alignment: Alignment.topLeft,
          fit: BoxFit.cover,
        ),
        boxShadow: shadow,
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      //       Text(
      //         "SmartApp",
      //         style: TextStyle(
      //             fontSize: 35,
      //             fontWeight: FontWeight.w900,
      //             color: Colors.white,
      //             shadows: shadow),
      //       ),
      //       Text(
      //         "Mengurus birokrasi",
      //         style: TextStyle(
      //           fontSize: 14,
      //           letterSpacing: 2,
      //           color: Colors.black54,
      //         ),
      //       ),
      //       Text(
      //         "Tanpa Ribet",
      //         style: TextStyle(
      //           fontSize: 14,
      //           letterSpacing: 2,
      //           color: Colors.black54,
      //         ),
      //       ),
      //     ])
      //   ],
      // ),
    );
  }
}
