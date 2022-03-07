import 'package:cbrconecta/utils/requests.dart';
import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

class BitacoraPage extends StatelessWidget {
  static String id = 'Bitacora_Page';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        backgroundColor: const Color(0XFF01579B),
        title: const Text('Bitácora'),
      ),
      body: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 200,
        children: <Widget>[
          MyCard(
              title: "Crear nueva bitacora",
              icon: Icons.bookmark_add,
              warna: Colors.blue,
              press: () => {}),
          MyCard(
              title: "Realizar nuestra bitacora",
              icon: Icons.find_in_page_rounded,
              warna: Colors.grey.shade400,
              press: () => {}),
          MyCard(
              title: "Realizar nuestra bitacora",
              icon: Icons.new_label_rounded,
              warna: Colors.yellow.shade800,
              press: () => {}),
        ],
      ),
    );
  }
}
