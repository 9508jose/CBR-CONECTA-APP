import 'package:cbrconecta/utils/requests.dart';
import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

class ColadoPage extends StatelessWidget {
  static String id = 'Colado_Page';
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
              title: "Trazo y Liberación",
              icon: Icons.bookmark_add,
              warna: Colors.blue,
              press: () => {}),
          MyCard(
              title: "Acero de refuerzo",
              icon: Icons.find_in_page_rounded,
              warna: Colors.grey.shade400,
              press: () => {}),
          MyCard(
              title: "Zimbra",
              icon: Icons.new_label_rounded,
              warna: Colors.yellow.shade800,
              press: () => {}),
          MyCard(
              title: "Programa de colado",
              icon: Icons.new_label_rounded,
              warna: Colors.yellow.shade800,
              press: () => {}),
          MyCard(
              title: "Liberación Colado",
              icon: Icons.new_label_rounded,
              warna: Colors.yellow.shade800,
              press: () => {}),
        ],
      ),
    );
  }
}
