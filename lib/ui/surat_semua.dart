import 'package:flutter/material.dart';
import 'package:smart_app/ui/surat_screen.dart';
import '../model/surat_model.dart';
import '../services/surat_service.dart';

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

class surat_Item extends StatelessWidget {
  final Surat_Model surat;
  const surat_Item({super.key, required this.surat});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 10),
        child: ListTile(
          leading: Icon(
            Icons.description_outlined,
            size: 50,
          ),
          title: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Text("${surat.jenis}")),
          subtitle: Row(
            children: [
              Text("status "),
              (surat.status == '1')
                  ? Container(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, bottom: 2, top: 2),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: Text(
                        "Prosses",
                        style: TextStyle(color: Colors.white),
                      ))
                  : Container(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, bottom: 2, top: 2),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: Text(
                        "Selesai",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ],
          ),
          trailing: (surat.status == '1')
              ? tombolHapus(context)
              : IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.file_download),
                ),
        ));
  }

  IconButton tombolHapus(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Konfirmasi'),
                content: Text(
                    'Apakah Anda yakin ingin membatalkan dan menghapus pengajuan dengan id ?' +
                        surat.id.toString()),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text('Batal'),
                    onPressed: () {
                      // Aksi yang akan dilakukan saat tombol "Batal" ditekan
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Ya'),
                    onPressed: () {
                      // Aksi yang akan dilakukan saat tombol "Ya" ditekan
                      Surat_services().hapus(surat.id.toString()).then((value) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Surat_screen();
                        }));
                      });

                      Navigator.of(context).pop();
                      // Tambahkan logika atau tindakan yang ingin Anda lakukan setelah konfirmasi
                    },
                  ),
                ],
              );
            },
          );
        },
        icon: Icon(Icons.delete));
  }
}
