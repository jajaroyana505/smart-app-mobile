import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

const List<String> list = <String>[
  'Surat Pengantar RT',
  'Surat Keterangan Tidak Mampu'
];

class Form_surat extends StatefulWidget {
  const Form_surat({super.key});

  @override
  State<Form_surat> createState() => _Form_suratState();
}

class _Form_suratState extends State<Form_surat> {
  String dropdownValue = list.first;
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
                    _inputRaedOnly(
                        "No. Induk Kependudukan", "3213050001122533"),
                    _inputRaedOnly("Nama Lengkap", "Muhammad Jaja Royana"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jenis Surat"),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField<String>(
                          value: dropdownValue,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
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
                    _input("Untuk keperluan"),
                    ElevatedButton(
                      onPressed: () {
                        // String enteredText = _textEditingController.text;
                        // Do something with the entered text
                        // print(enteredText);
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

  _input(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 10,
        ),
        TextField(
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

  _inputRaedOnly(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 10,
        ),
        TextField(
          readOnly: true,
          style: TextStyle(),
          controller: TextEditingController(text: value),
          decoration: InputDecoration(
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
