import 'package:cbrconecta/pages/admin/admin_crear_proyecto.dart';
import 'package:cbrconecta/pages/admin/admin_ver_proyectos.dart';
import 'package:cbrconecta/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff01579B),
      appBar: AppBar(
        backgroundColor: const Color(0XFF01579B),
        title: FutureBuilder(
          future: getName(),
          builder: (context, data) {
            if (data.hasError) {
              return Text("Ocurrió un error al cargar los proyectos: " +
                  data.error.toString());
            } else if (data.hasData) {
              var items = data.data;
              return Text(
                "Bienvenido " + items.toString(),
              );
            } else {
              return const LinearProgressIndicator();
            }
          },
        ),
      ),
      drawer: const OwnDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 250),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CrearProyectoPage(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "Crear proyecto",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProyectosAdminPage(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "Ver proyectos",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: const Text('Ayuda'),
        icon: const Icon(Icons.help),
        backgroundColor: Colors.teal.shade800,
      ),
    );
  }

  Future getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? dato = sp.getString("nombre");
    return dato as String;
  }
}
