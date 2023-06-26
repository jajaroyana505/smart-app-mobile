import 'package:flutter/material.dart';
import 'package:smart_app/ui/home_page.dart';
import './helper/user_info.dart';
import './ui/login.dart';
import 'package:smart_app/ui/surat_form.dart';
import 'package:smart_app/ui/surat_page.dart';
import 'ui/home.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Smart App",
    theme: ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.green,
          onPrimary: Colors.white,
          secondary: Colors.grey,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.green,
          onBackground: Colors.green,
          surface: Colors.green,
          onSurface: Colors.green),
      // primarySwatch: Colors.blue,

      fontFamily: 'Roboto',
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.green),
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        elevation: 0,
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : Home_page(),
  ));
}
