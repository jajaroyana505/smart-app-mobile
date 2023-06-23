import 'package:flutter/material.dart';
import 'package:smart_app/ui/surat_form.dart';

class Surat_page extends StatelessWidget {
  // const Surat_pgae({super.key});

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
            ListView(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.description_outlined,
                      size: 50,
                    ),
                    title: Text("Surat Pengantar"),
                    subtitle: Text("satatus : Menunggu"),
                    trailing: Text("01.00"),
                  ),
                ),
              ],
            ),
            ListView(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.description_outlined,
                      size: 50,
                    ),
                    title: Text("Surat Pengantar"),
                    subtitle: Text("satatus : Menunggu"),
                    trailing: Text("01.00"),
                  ),
                ),
              ],
            ),
            ListView()
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
