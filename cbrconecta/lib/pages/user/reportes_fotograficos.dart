import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

import 'documentos.dart';
import 'navegador_obras.dart';
import 'mis_obras.dart';

class ReportesFotograficosPage extends StatelessWidget {
  final String idObra;

  const ReportesFotograficosPage({
    required this.idObra,
  });

  static String id = "ReportesFotograficos_Page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavObraPage(idObra: idObra),
              ),
            ),
          },
        ),
        backgroundColor: const Color(0XFF01579B),
        title: const Text('Reportes fotográficos'),
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
              title: "Visita técnica",
              icon: Icons.engineering,
              warna: Colors.blueGrey.shade600,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Reportes fotográficos',
                      identificador: 'Visita técnica',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Arranque y PM",
              icon: Icons.build,
              warna: Colors.grey.shade600,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Reportes fotográficos',
                      identificador: 'Arranque y PM',
                      idObra: idObra,
                    ),
                  ),
                );
              },
            ),
            MyCard(
              title: "Avance semanal",
              icon: Icons.content_paste,
              warna: Colors.amber.shade600,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Reportes fotográficos',
                      identificador: 'Avance semanal',
                      idObra: idObra,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ObrasPage()))
        },
        label: const Text('Inicio'),
        icon: const Icon(Icons.home),
        backgroundColor: Colors.teal.shade800,
      ),
    );
  }
}
