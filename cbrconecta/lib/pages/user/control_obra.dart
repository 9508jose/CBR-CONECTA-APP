import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

import 'documentos.dart';
import 'navegador_obras.dart';
import 'mis_obras.dart';
import 'liberacion_colado.dart';

class ControlObraPage extends StatelessWidget {
  final String idObra;

  const ControlObraPage({
    required this.idObra,
  });

  static String id = "ControlObra_Page";
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
        title: const Text("Control de obra"),
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
              title: "Liberación de colado",
              icon: Icons.check,
              warna: Colors.green.shade700,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LiberacionColadoPage(
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Minuta de campo",
              icon: Icons.file_present,
              warna: Colors.red.shade400,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Minuta de campo',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Bitácora de obra",
              icon: Icons.book_online,
              warna: Colors.blue.shade400,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Bitácora de obra',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Requisición de material",
              icon: Icons.format_list_bulleted,
              warna: Colors.green.shade400,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Requisición de material',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Dispersión",
              icon: Icons.scatter_plot,
              warna: Colors.red.shade800,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Dispersión',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Asistencia",
              icon: Icons.assistant,
              warna: Colors.blueAccent.shade700,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Asistencia',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Almacén",
              icon: Icons.storage,
              warna: Colors.deepPurple.shade400,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Almacén',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Comprobación de gastos",
              icon: Icons.monetization_on,
              warna: Colors.blue.shade400,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Comprobación de gastos',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Insumos",
              icon: Icons.mediation_sharp,
              warna: Colors.green.shade700,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Insumos',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Programa de obra",
              icon: Icons.check,
              warna: Colors.amber.shade400,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Programa de obra',
                      idObra: idObra,
                    ),
                  ),
                ),
              },
            ),
            MyCard(
              title: "Orden cambio",
              icon: Icons.change_circle,
              warna: Colors.blueGrey.shade700,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentosPage(
                      rubro: 'Control de obra',
                      identificador: 'Orden cambio',
                      idObra: idObra,
                    ),
                  ),
                ),
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
