// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers

import 'package:cbrconecta/utils/requests.dart';
import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

class FormatCapPruebPage extends StatelessWidget {
  static String id = 'formato_capacitacion_prueba';
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
        title: const Text('Formato de capacitación y pruebas'),
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
                title: "Formatos de capacitación",
                icon: Icons.article,
                warna: Colors.blue.shade700,
                press: () => {}),
            MyCard(
                title: "Cuestionario",
                icon: Icons.question_answer,
                warna: Colors.deepPurple,
                press: () => {}),
          ],
        ),
      ),
    );
  }
}
