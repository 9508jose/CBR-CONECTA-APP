// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cbrconecta/pages/user/reportes_fotograficos.dart';
import 'package:cbrconecta/utils/requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class DocumentosPage extends StatefulWidget {
  final String rubro;
  final String identificador;
  final String idObra;
  static String id = 'Documento_page';

  const DocumentosPage({
    required this.rubro,
    required this.identificador,
    required this.idObra,
  });

  @override
  _DocumentosPage createState() => _DocumentosPage();
}

class _DocumentosPage extends State<DocumentosPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Requests req = Requests();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ReportesFotograficosPage(idObra: widget.idObra),
              ),
            ),
          },
        ),
        backgroundColor: const Color(0xff01579B),
        title: Text(widget.identificador),
      ),
      body: FutureBuilder(
        future: getPath(widget.rubro, widget.identificador),
        builder: (context, data) {
          if (data.hasData) {
            if (data.data != false) {
              return PDFView(
                filePath: data.data.toString(),
                onRender: (pages) => setState(() => this.pages = pages!),
                onViewCreated: (controller) =>
                    setState(() => this.controller = controller),
                onPageChanged: (indexPage, _) =>
                    setState(() => this.indexPage = indexPage!),
                onError: (error) =>
                    "No existe un documento PDF para esta sección",
              );
            } else {
              return const Text("No hay un documento PDF para este rubro.");
            }
          } else if (data.hasError) {
            return Text("No hay un documento PDF para este rubro. Error\n" +
                data.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: const Color(0xff01579B),
            icon: const Icon(Icons.edit),
            label: const Text("Editar documento"),
            onPressed: () {
              req.openPDF(widget.rubro, widget.identificador);
            },
            heroTag: null,
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            backgroundColor: const Color(0xff01579B),
            icon: const Icon(Icons.upload_file),
            label: const Text("Subir documento"),
            onPressed: () {
              req.subirPDF(widget.rubro, widget.identificador, widget.idObra);
            },
            heroTag: null,
          )
        ],
      ),
    );
  }

  Future<dynamic> getPath(String rubro, String identificador) async {
    final Directory? pathSD = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    var finalPath = "${pathSD!.path}/Plantilla/$rubro/$identificador.pdf";
    bool existe = await File(finalPath).exists();
    if (existe) {
      return finalPath.toString();
    } else {
      return false;
    }
  }
}
