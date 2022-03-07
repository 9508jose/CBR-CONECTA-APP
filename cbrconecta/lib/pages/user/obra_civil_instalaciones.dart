import 'package:cbrconecta/utils/requests.dart';
import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

class ObraPage extends StatelessWidget {
  static String id = 'obra_civilinst';
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
        title: const Text('Obra Civil e instalaciones'),
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
                title: "Programa de obra personalizado",
                icon: Icons.arrow_circle_up_sharp,
                warna: Colors.blue.shade400,
                press: () => {},
              ),
              MyCard(
                title: "Nuevo programa de obra/base",
                icon: Icons.build,
                warna: Colors.grey.shade600,
                press: () => {},
              ),
              MyCard(
                title: "Reporte semanal",
                icon: Icons.content_paste,
                warna: Colors.brown.shade700,
                press: () => {},
              ),
              MyCard(
                title: "Bitacora",
                icon: Icons.assignment_turned_in,
                warna: Colors.deepPurple,
                press: () => {},
              ),
              MyCard(
                title: "Estimacion de destagista",
                icon: Icons.accessibility,
                warna: Colors.blueAccent.shade700,
                press: () => {},
              ),
              MyCard(
                title: "Implementacion clientes",
                icon: Icons.book,
                warna: Colors.orange,
                press: () => {},
              ),
              MyCard(
                title: "Comprobaciones y autorizaciones",
                icon: Icons.article_outlined,
                warna: Colors.blue.shade400,
                press: () => {},
              ),
              MyCard(
                title: "Requisiciones",
                icon: Icons.assignment,
                warna: Colors.brown,
                press: () => {},
              ),
              MyCard(
                title: "Materiales y equipos",
                icon: Icons.business,
                warna: Colors.black,
                press: () => {},
              ),
              MyCard(
                title: "Lista de raya subcontratistas",
                icon: Icons.cases_outlined,
                warna: Colors.grey.shade700,
                press: () => {},
              ),
              MyCard(
                title: "Caja chica",
                icon: Icons.attach_money,
                warna: Colors.greenAccent.shade700,
                press: () => {},
              ),
              MyCard(
                title: "Cierre de obra",
                icon: Icons.emoji_events,
                warna: Colors.yellowAccent.shade700,
                press: () => {},
              ),
              MyCard(
                title: "Lista de raya interna",
                icon: Icons.cases_outlined,
                warna: Colors.grey.shade600,
                press: () => {},
              ),
              MyCard(
                title: "Formato de inspeccion",
                icon: Icons.find_replace,
                warna: Colors.cyan.shade700,
                press: () => {},
              ),
              MyCard(
                title: "Reportes",
                icon: Icons.folder_sharp,
                warna: Colors.teal.shade900,
                press: () => {},
              ),
            ]),
      ),
    );
  }
}
