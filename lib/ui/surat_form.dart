import 'package:flutter/material.dart';
import 'package:smart_app/ui/surat_page.dart';
import '../model/surat_model.dart';
import '../services/surat_service.dart';

const List<String> list = <String>[
  '--Pilih Jenis Surat--',
  'Surat Pengantar RT',
  'Surat Keterangan Tidak Mampu'
];

class Form_surat extends StatefulWidget {
  const Form_surat({super.key});

  @override
  State<Form_surat> createState() => _Form_suratState();
}

class _Form_suratState extends State<Form_surat> {
  String _jSurat = list.first;
  final _nikController = TextEditingController(text: "321305040301000023");
  final _namaController = TextEditingController(text: "Muhammad Jaja Royana");
  final _jkController = TextEditingController(text: "Laki-laki");
  final _ttlController = TextEditingController(text: "Subang, 4 Maret 2001");
  final _alamatController = TextEditingController(
      text: "Kp. Cijambe RT.02/RW.03 No.39 Dusun. Cimareme");
  final _keperluanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Pengajuan Surat"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _inputRaedOnly("No. Induk Kependudukan", _nikController),
                    _inputRaedOnly("Nama Lengkap", _namaController),
                    _inputRaedOnly("Jenis Kelamin", _jkController),
                    _inputRaedOnly("Tempat, Tanggal lahir", _ttlController),
                    _inputRaedOnly("Alamat", _alamatController),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jenis Surat"),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField<String>(
                          value: _jSurat,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              _jSurat = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                    _input("Untuk keperluan", _keperluanController),
                    ElevatedButton(
                      onPressed: () async {
                        Surat_Model surat = new Surat_Model(
                            nik: _nikController.text,
                            jenis: _jSurat,
                            keperluan: _keperluanController.text,
                            tanggal: "2001-01-01",
                            status: "0");
                        await Surat_services().simpan(surat).then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Surat_page()));
                        });
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _input(String label, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  _inputRaedOnly(String label, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 10,
        ),
        TextField(
          readOnly: true,
          style: TextStyle(color: Colors.black54),
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(10, 85, 85, 90),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
