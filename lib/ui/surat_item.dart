import 'package:flutter/material.dart';
import '../model/surat_model.dart';

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
        trailing: Text("01.00"),
      ),
    );
  }
}
