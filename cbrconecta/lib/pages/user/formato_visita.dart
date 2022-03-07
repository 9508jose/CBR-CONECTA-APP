// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers

import 'package:cbrconecta/utils/requests.dart';
import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

class FormatVisitPage extends StatelessWidget {
  static String id = 'formato_visita';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Requests req = Requests();
    //req.checkLogin(context, 2);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        backgroundColor: const Color(0XFF01579B),
        title: const Text('Formatos de visita'),
      ),
      body: Center(
        child: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 200,
          children: <Widget>[
            MyCard(
              title: "Visita general",
              icon: Icons.person,
              warna: Colors.blue,
              press: () => {},
            ),
            MyCard(
              title: "Supervisión de operación",
              icon: Icons.badge,
              warna: Colors.blueGrey,
              press: () => {},
            ),
            MyCard(
              title: "Formato de arranque y prueba",
              icon: Icons.article,
              warna: Colors.brown,
              press: () => {},
            ),
            MyCard(
              title: "Formato de supervisión de obra o instalaciones",
              icon: Icons.list,
              warna: Colors.red,
              press: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
