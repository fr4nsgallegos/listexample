import 'package:flutter/material.dart';
import 'package:listexample/institution_model.dart';
import 'package:listexample/person_model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //instanciando una institución
  Institution tecsup = Institution(
    name: "Tecsup",
    people: [],
  );

  //instanciando personas
  Person pepe =
      Person(name: "Pepe", address: "Av pepe123", phone: "1234456789");
  Person matias =
      Person(name: "Mathias", address: "avlima 123", phone: "789456132");
  Person maria =
      Person(name: "Maria", address: "AV 123 456", phone: "987654321");
  Person juana = Person(name: "Juana", address: "AV LKJ", phone: "00000000");

  //Lista de personas a partir de nuestra clase person
  List<Person> peopleClassList = [];

  //Lista de instituciones
  List<Institution> institutions = [];

  @override
  void initState() {
    super.initState();
    //usando una lista
    peopleClassList.add(pepe);
    peopleClassList.add(matias);
    peopleClassList.add(maria);
    peopleClassList.add(juana);

    //usando el atriburo people de la clase tecsup
    tecsup.people.add(pepe);
    tecsup.people.add(matias);

    //Iniciar pantalla agregando un elemento a mi lista de instituciones
    institutions.add(tecsup);
  }

  // //lista con nombres

  // List<String> names = [
  //   "Frans",
  //   "Pedro",
  //   "Juan",
  // ];

  // //Función que me devuelve una lista con widgets TEXT(<cada nombre>)
  // List<Widget> buildNames() {
  //   List<Widget> tmp = [];
  //   names.forEach((String mandarina) {
  //     tmp.add(Text(mandarina));
  //   });
  //   return tmp;
  // }

  // //Lista de personas, cada persona es un mapa
  // List<Map<String, dynamic>> peopleList = [
  //   {
  //     "name": "Adrian",
  //     "address": "av123 123",
  //     "phone": "123456789",
  //   },
  //   {
  //     "name": "Eddy",
  //     "address": "Av los arces 456",
  //     "phone": "987654321",
  //   },
  //   {
  //     "name": "Pedro",
  //     "address": "av 7 los guiosos",
  //     "phone": "1111111",
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My classes"),
          actions: [
            IconButton(
              onPressed: () {
                Institution utp = Institution(
                  name: "UCV",
                  people: [],
                );
                institutions.add(utp);
                setState(() {});
              },
              icon: Icon(Icons.add),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              print(tecsup.people.length);
            },
            icon: Icon(
              Icons.menu,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                ...institutions
                    .map((i) => Column(
                          children: [
                            Row(
                              // mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(i.name),
                                IconButton(
                                  onPressed: () {
                                    //Agregando una persona a la Lista de personas de Tecsup
                                    i.people.add(
                                      Person(
                                        name: "Luana",
                                        address: "Cale Juares 123",
                                        phone: "9856513541",
                                      ),
                                    );
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.add_box),
                                )
                              ],
                            ),
                            Divider(
                              height: 20,
                              thickness: 3,
                              color: Color(0xffD44118),
                            ),
                            // ...names
                            //     .map((e) => Text(e))
                            //     .toList(), //Método para agregar lista de nombres a partir del mapeo de la lista
                            // ...buildNames(), //funcion que me agrega la lista de nombres con widgets TEXT

                            ...i.people
                                .map(
                                  (Person element) => ListTile(
                                    leading: CircleAvatar(
                                      child: Text(element.name[0]),
                                    ),
                                    title: Text(element.name),
                                    subtitle: Text(element.address),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                          ),
                                          onPressed: () {
                                            //NO FUNCIONA PORQUE ESTOY REINSTANCIANDO UN
                                            //OBJETO PERSONA Y DEBEÉRIA REINSTEARLO PARA QUE
                                            // SE REFLEJEN LOS CAMBIOS
                                            // element = Person(
                                            //     name: "asdads",
                                            //     address: "asdas",
                                            //     phone: "65654654");

                                            //FORMA CORRECTA
                                            element.name = "Daniel";
                                            element.address = "av cayma 987";
                                            element.phone = "00000000";
                                            setState(() {});
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                          ),
                                          onPressed: () {
                                            //REMOVER POR ELEMENTO DEPENDIENDO DONDE HAGA CLIC
                                            i.people.remove(element);

                                            //REMOVER POR ELEMENTO de MI CLASE TECSUP
                                            // tecsup.people.remove(element);

                                            //ELIMINAR EN CIERTA POSICIÓN
                                            // tecsup.people.removeAt(0);

                                            //ELIMINAR EN UN RANGO
                                            // tecsup.people.removeRange(0, 2);

                                            // ELIMINAR EL ÚLTIMO
                                            // tecsup.people.removeLast();
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
