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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //lista con nombres
  List<String> names = [
    "Frans",
    "Pedro",
    "Juan",
  ];

  //Función que me devuelve una lista con widgets TEXT(<cada nombre>)
  List<Widget> buildNames() {
    List<Widget> tmp = [];
    names.forEach((String mandarina) {
      tmp.add(Text(mandarina));
    });
    return tmp;
  }

  //Lista de personas, cada persona es un mapa
  List<Map<String, dynamic>> peopleList = [
    {
      "name": "Adrian",
      "address": "av123 123",
      "phone": "123456789",
    },
    {
      "name": "Eddy",
      "address": "Av los arces 456",
      "phone": "987654321",
    },
    {
      "name": "Pedro",
      "address": "av 7 los guiosos",
      "phone": "1111111",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My classes"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LOS NOMBRES"),
                    IconButton(
                        onPressed: () {
                          peopleList.add(
                            {
                              "name": "Pedro",
                              "address": "av larco 123",
                              "phone": "12345798",
                            },
                          );
                          setState(() {});
                        },
                        icon: Icon(Icons.add_box))
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 3,
                  color: const Color.fromRGBO(33, 150, 243, 1),
                ),
                // ...names
                //     .map((e) => Text(e))
                //     .toList(), //Método para agregar lista de nombres a partir del mapeo de la lista
                // ...buildNames(), //funcion que me agrega la lista de nombres con widgets TEXT
                ...peopleList
                    .map(
                      (person) => ListTile(
                        leading: CircleAvatar(
                          child: Text(person["name"][0]),
                        ),
                        title: Text(person["name"]),
                        subtitle: Text(person["address"]),
                        trailing: Text(person["phone"]),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
