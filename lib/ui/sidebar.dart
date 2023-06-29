import 'package:flutter/material.dart';
import 'package:smart_app/model/user_model.dart';
import 'package:smart_app/services/user_service.dart';
import 'package:smart_app/ui/login.dart';
import '../helper/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  var user;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    User_model userData = await User_services().getDataFromSharedPref();
    setState(() {
      user = userData;
    });
  }

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
                UserInfo().getNama.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              accountEmail: Text("NIK : ",
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
            onTap: () {
              UserInfo().logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
    ;
  }
}
