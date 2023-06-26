import 'package:flutter/material.dart';
import 'package:smart_app/ui/surat_form.dart';
import 'package:smart_app/services/surat_service.dart';
import 'package:smart_app/ui/surat_proses_page.dart';
import 'package:smart_app/ui/surat_selesai_page.dart';
import 'package:smart_app/ui/surat_semua.dart';
import '../model/surat_model.dart';
import './surat_item.dart';

class Surat_page extends StatelessWidget {
  // const Surat_pgae({super.key});
  Stream<List<Surat_Model>> dataSurat() async* {
    List<Surat_Model> data = await Surat_services().dataSurat();
    yield data;
  }

  List<Tab> myTab = [
    Tab(
      text: "Semua",
      icon: Icon(Icons.all_inbox),
    ),
    Tab(
      text: "Proses",
      icon: Icon(Icons.history),
    ),
    Tab(
      text: "Selesai",
      icon: Icon(Icons.assignment_turned_in_outlined),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.auto_awesome_mosaic_rounded),
          // centerTitle: true,
          title: Text("Pengajuan Surat"),
          bottom: TabBar(
            tabs: myTab,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.green,
            indicatorColor: Colors.green,
            indicator: BoxDecoration(
              color: Colors.green,
            ),
            // labelColor: Colors.green,
          ),
        ),
        body: TabBarView(
          children: [
            Semua_surat(),
            Surat_proses_page(),
            Surat_selesai_page(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Form_surat();
            }));
          },
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
