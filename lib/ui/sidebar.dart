import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/06/18/18/01/potrait-2416628_1280.jpg'),
              ),
              accountName: Text(
                "Muhammad Jaja Royana",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              accountEmail: Text("NIK : 3213050103020001",
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          ListTile(
            leading: Icon(Icons.file_open),
            title: Text("Riwayat pengajuan"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
