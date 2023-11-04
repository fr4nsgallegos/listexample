// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  List<String> names = ["Frans", "Pedro", "Juan"];

  List<Widget> buildNames() {
    List<Widget> tmp = [];
    names.forEach((String mandarina) {
      tmp.add(Text(mandarina));
    });
    return tmp;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Column(
                children: buildNames(),
              ),
              // buildNames()
              Text("LOS NOMBRES"),
              Divider(
                height: 20,
                thickness: 5,
                color: Colors.blue,
              ),
              ...buildNames(),
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              )
              // for(int i =0)
            ],
          ),
        ),
      ),
    );
  }
}
