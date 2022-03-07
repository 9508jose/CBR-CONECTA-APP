// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:cbrconecta/models/proyectos_admin.dart';
import 'package:cbrconecta/pages/admin/admin_main.dart';
import 'package:cbrconecta/pages/admin/admin_ver_usuarios.dart';
import 'package:cbrconecta/utils/requests.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProyectosAdminPage extends StatelessWidget {
  static String id = 'Admin_Proyectos_Page';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff01579B),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminPage(),
              ),
            ),
          },
        ),
        backgroundColor: const Color(0XFF01579B),
        title: const Text('Ver proyectos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: 12,
                  left: (size.width * .2) / 2,
                  right: (size.width * .2) / 2,
                ),
                child: FutureBuilder(
                  future: obtenerObras(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Text("Error al obtener la información: " +
                          data.error.toString());
                    } else if (data.hasData) {
                      var items = data.data as List<ProyectosAdminModel>;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: items == null ? 0 : items.length,
                        itemBuilder: (context, index) {
                          return btnProyecto(
                              size: size, text: items[index].nombre.toString());
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<ProyectosAdminModel>> obtenerObras() async {
    Requests req = Requests();
    var url = Uri.parse(req.domain + "/api/Proyectos/MostarObrasActivas");
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.get(url);
    var list = json.decode(response.body) as List<dynamic>;
    return list.map((e) => ProyectosAdminModel.fromJson(e)).toList();
  }
}

class btnProyecto extends StatelessWidget {
  const btnProyecto({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => usuariosPage(),
              ),
            );
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          textColor: Colors.blue,
          padding: const EdgeInsets.all(0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.apartment,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            margin: const EdgeInsets.all(16),
          ),
          color: Colors.tealAccent.shade700,
        ),
      ],
    );
  }
}
