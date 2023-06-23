import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tetangga"),
      ),
      body: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/01/09/11/08/startup-594090_1280.jpg'),
                    fit: BoxFit.cover),
              ),
              height: heightApp * 0.3,
              width: widthApp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text("Ini adalah text"),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
