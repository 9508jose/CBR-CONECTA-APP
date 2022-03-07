import 'package:cbrconecta/utils/requests.dart';
import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

class CheckPage extends StatelessWidget {
  static String id = 'Check_Page';
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
        title: const Text('Check list y protocolos de prueba'),
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
              title: "Protocolo de pruebas bombas",
              icon: Icons.wb_twilight,
              warna: Colors.red.shade400,
              press: () => {},
            ),
            MyCard(
              title: "Protocolo de pruebas soplador",
              icon: Icons.air_outlined,
              warna: Colors.blue.shade400,
              press: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
