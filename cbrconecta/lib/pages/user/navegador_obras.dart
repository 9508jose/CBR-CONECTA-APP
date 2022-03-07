// ignore_for_file: deprecated_member_use

import 'package:cbrconecta/pages/user/control_obra.dart';
import 'package:cbrconecta/pages/user/mis_obras.dart';
import 'package:cbrconecta/pages/user/reportes_fotograficos.dart';
import 'package:cbrconecta/utils/requests.dart';
import 'package:flutter/material.dart';

import 'operaciones_mantenimiento.dart';

class NavObraPage extends StatelessWidget {
  final String idObra;

  const NavObraPage({
    required this.idObra,
  });

  static String id = "NavObra_Page";
  @override
  Widget build(BuildContext context) {
    Requests req = Requests();
    //req.checkLogin(context, 2);
    return Scaffold(
      backgroundColor: const Color(0xff01579B),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ObrasPage(),
              ),
            ),
          },
        ),
        backgroundColor: const Color(0XFF01579B),
        title: const Text("Navegador de obras"),
      ),
      body: Center(
        child: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          maxCrossAxisExtent: 200,
          children: [
            OwnCard(
              text: "Reportes fotográficos",
              items: "3",
              icon: Icons.photo,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ReportesFotograficosPage(idObra: idObra),
                  ),
                );
              },
            ),
            OwnCard(
              text: "Control de obra",
              items: "11",
              icon: Icons.pest_control,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ControlObraPage(idObra: idObra),
                  ),
                );
              },
            ),
            OwnCard(
              text: "Operaciones y mantenimiento",
              items: "6",
              icon: Icons.settings,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OperacionesYMantenimientoPage(idObra: idObra),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: const Color(0xff01579B),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ObrasPage(),
            ),
          ),
        },
        label: const Text('Inicio'),
        icon: const Icon(
          Icons.home,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class OwnCard extends StatelessWidget {
  final String text;
  final String items;
  final IconData icon;
  final VoidCallback press;
  const OwnCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: const Color(0xff1078C0),
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: press,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 70.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                items + " items",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffC9E0F1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
