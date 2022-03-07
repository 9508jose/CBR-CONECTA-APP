import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

import 'documentos.dart';
import 'navegador_obras.dart';
import 'mis_obras.dart';

class OperacionesYMantenimientoPage extends StatelessWidget {
  final String idObra;

  const OperacionesYMantenimientoPage({
    required this.idObra,
  });

  static String id = 'OperacionesYMantenimiento_Page';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //req.checkLogin(context, 2);
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
        title: const Text('Operaciones y mantenimiento'),
      ),
      body: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 200,
        children: <Widget>[
          MyCard(
            title: "Constancia de capacitación",
            icon: Icons.insert_drive_file,
            warna: Colors.blue,
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Operaciones y mantenimiento',
                    identificador: 'Constancia de capacitación',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
          MyCard(
            title: "Formato de visita técnica",
            icon: Icons.book_sharp,
            warna: const Color(0xffe07a5f),
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Operaciones y mantenimiento',
                    identificador: 'Formato de visita técnica',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
          MyCard(
            title: "Bitácora de operación y mantenimiento",
            icon: Icons.edit_road,
            warna: const Color(0xff0a9396),
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Operaciones y mantenimiento',
                    identificador: 'Bitácora de operación y mantenimiento',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
          MyCard(
            title: "Inscripción al programa de asistencia técnica",
            icon: Icons.app_registration,
            warna: const Color(0xff90be6d),
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Operaciones y mantenimiento',
                    identificador:
                        'Inscripción al programa de asistencia técnica',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
          MyCard(
            title: "Encuesta de satisfacción de servicio",
            icon: Icons.sentiment_very_satisfied_rounded,
            warna: const Color(0xff457b9d),
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Operaciones y mantenimiento',
                    identificador: 'Encuesta de satisfacción de servicio',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
          MyCard(
            title: "Encuesta de satisfacción de arranque y puesta en marcha",
            icon: Icons.sentiment_very_satisfied_rounded,
            warna: const Color(0xffe9c46a),
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Operaciones y mantenimiento',
                    identificador:
                        'Encuesta de satisfacción de arranque y puesta en marcha',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
        ],
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
