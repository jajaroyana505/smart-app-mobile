import 'package:flutter/material.dart';
import '../model/surat_model.dart';
import '../services/surat_service.dart';

class Surat_proses_page extends StatelessWidget {
  const Surat_proses_page({super.key});
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
    if (surat.status == "1") {
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
              Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, bottom: 2, top: 2),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Text(
                    "Prosses",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          trailing: Text("01.00"),
        ),
      );
    } else {
      return SizedBox(
        width: 0,
        height: 0,
      );
    }
  }
}
