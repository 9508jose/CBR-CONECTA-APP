// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:cbrconecta/models/proyectos.dart';
import 'package:cbrconecta/pages/user/navegador_obras.dart';
import 'package:cbrconecta/utils/requests.dart';
import 'package:cbrconecta/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ObrasPage extends StatefulWidget {
  static String id = "Obras_Page";

  const ObrasPage({Key? key}) : super(key: key);
  @override
  _ObrasPageState createState() => _ObrasPageState();
}

enum ButtonState { init, loading, done }

class _ObrasPageState extends State<ObrasPage> {
  bool isAnim = true;
  ButtonState state = ButtonState.init;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isStretch = state == ButtonState.init;
    final isDone = state == ButtonState.done;
    Requests req = Requests();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0XFF01579B),
        title: const Text('Mis proyectos'),
        centerTitle: true,
      ),
      drawer: const OwnDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: (size.width * .2) / 2,
                      right: (size.width * .2) / 2,
                      bottom: (size.height * 0.2 - 27) / 2),
                  height: size.height * .18,
                  decoration: const BoxDecoration(
                    color: Color(0xff01579B),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(
                        36,
                      ),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "¡Hola! ",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      FutureBuilder(
                        future: getName(),
                        builder: (context, data) {
                          if (data.hasError) {
                            return Text("Ocurrió un error al cargar el nombre" +
                                data.error.toString());
                          } else if (data.hasData) {
                            var items = data.data;
                            return Text(
                              items.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            );
                          } else {
                            return const Expanded(
                              child: LinearProgressIndicator(
                                minHeight: 30,
                              ),
                            );
                          }
                        },
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            child: isStretch
                                ? cardDownload(req)
                                : cardLoading(isDone),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 12,
                      left: (size.width * .2) / 2,
                      right: (size.width * .2) / 2,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FutureBuilder(
                          future: obtenerObras(),
                          builder: (context, data) {
                            if (data.hasError) {
                              return Text(
                                  "Ocurrió un error al cargar los proyectos: " +
                                      data.error.toString());
                            } else if (data.hasData) {
                              var items =
                                  data.data as List<ProyectosUsuarioModel>;
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: items == null ? 0 : items.length,
                                itemBuilder: (context, index) {
                                  return BtnObra(
                                      text: items[index].nombre.toString(),
                                      idObra: items[index].id.toString());
                                },
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<ProyectosUsuarioModel>> obtenerObras() async {
    Requests req = Requests();
    var url = Uri.parse(req.domain + "/api/Usuario/ObrasUsuario");
    SharedPreferences sp = await SharedPreferences.getInstance();
    int? id = sp.getInt("id");
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonB = '{"id": $id}';
    var response = await http.post(url, headers: headers, body: jsonB);
    var list = json.decode(response.body) as List<dynamic>;
    return list.map((e) => ProyectosUsuarioModel.fromJson(e)).toList();
  }

  Future getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? dato = sp.getString("nombre");
    return dato as String;
  }

  Card cardDownload(Requests req) {
    return Card(
      color: const Color(0XFFECEFF1),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () async {
          setState(() => state = ButtonState.loading);
          await req.obtenerPDFs();
          setState(() => state = ButtonState.done);
          await Future.delayed(const Duration(seconds: 3));
          setState(() => state = ButtonState.init);
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Icon(Icons.download),
              SizedBox(
                width: 90,
                child: Text(
                  "Descargar archivos",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardLoading(bool done) {
    final color = done ? Colors.green : Colors.white;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(3)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: done
              ? const [
                  Icon(Icons.done, color: Colors.white),
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Archivos descargados",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]
              : [
                  CircularProgressIndicator(color: Colors.teal.shade600),
                  const SizedBox(
                    width: 90,
                    child: Text(
                      "Descargando",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}

class BtnObra extends StatelessWidget {
  final String text;
  final String idObra;
  const BtnObra({
    Key? key,
    required this.text,
    required this.idObra,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
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
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavObraPage(
                  idObra: idObra,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
