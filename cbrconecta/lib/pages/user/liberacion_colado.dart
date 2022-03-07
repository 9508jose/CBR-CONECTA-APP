import 'package:cbrconecta/utils/requests.dart';
import 'package:cbrconecta/widgets/card_dash.dart';
import 'package:flutter/material.dart';

import 'documentos.dart';
import 'mis_obras.dart';
import 'control_obra.dart';

class LiberacionColadoPage extends StatelessWidget {
  final String idObra;

  const LiberacionColadoPage({
    required this.idObra,
  });

  static String id = "LiberacionColado_Page";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Requests req = Requests();
    req.checkLogin(context, 2);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ControlObraPage(idObra: idObra),
              ),
            ),
          },
        ),
        backgroundColor: const Color(0XFF01579B),
        title: const Text('Liberación de colado'),
      ),
      body: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 200,
        children: <Widget>[
          MyCard(
            title: "Trazo y nivelación",
            icon: Icons.edit,
            warna: Colors.blue,
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Liberación de colado',
                    identificador: 'Trazo y nivelación',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
          MyCard(
            title: "Acero de refuerzo",
            icon: Icons.find_in_page_rounded,
            warna: Colors.grey.shade400,
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Liberación de colado',
                    identificador: 'Acero de refuerzo',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
          MyCard(
            title: "Cimbra",
            icon: Icons.new_label_rounded,
            warna: Colors.yellow.shade800,
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Liberación de colado',
                    identificador: 'Cimbra',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
          MyCard(
            title: "Programa de colado",
            icon: Icons.checklist,
            warna: Colors.orange.shade800,
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Liberación de colado',
                    identificador: 'Programa de colado',
                    idObra: idObra,
                  ),
                ),
              ),
            },
          ),
          MyCard(
            title: "Liberación de colado",
            icon: Icons.check,
            warna: Colors.green.shade800,
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentosPage(
                    rubro: 'Liberación de colado',
                    identificador: 'Liberación de colado',
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
