// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:cbrconecta/models/archivos_catalog.dart';
import 'package:cbrconecta/models/proyectos.dart';
import 'package:cbrconecta/pages/admin/admin_main.dart';
import 'package:cbrconecta/pages/user/login.dart';
import 'package:cbrconecta/pages/user/mis_obras.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cbrconecta/models/user.dart';

class Requests {
  String domain = "http://www.TestCBRConectaAPI.somee.com";
  //Petición post para login
  Future<bool> login(String user, String pass) async {
    try {
      var url = Uri.parse(domain + "/api/usuario/log");
      Map<String, String> headers = {"Content-type": "application/json"};
      String jsonB = '{"usuario": "$user", "contraseña": "$pass"}';
      var response = await http.post(url, headers: headers, body: jsonB);
      if (response.body != '') {
        var jsondecoded = json.decode(response.body) as List<dynamic>;
        SharedPreferences sp = await SharedPreferences.getInstance();
        await sp.setInt('id', jsondecoded[0]["id"]);
        await sp.setString('nombre', jsondecoded[0]["nombre"]);
        await sp.setInt('privilegios', jsondecoded[0]["privilegios"]);
        await sp.setString('puesto', jsondecoded[0]["puesto"]);
        await sp.setString('departamento', jsondecoded[0]["departamento"]);
        await sp.setString('email', jsondecoded[0]["email"]);
        jsondecoded.map((e) => UserDataModel.fromJson(e));
        return true;
      }
    } on TimeoutException catch (e) {
      print("Tardó la conexión:\n" + e.toString());
      return false;
    } on Error catch (e) {
      print("Error:\n" + e.toString());
      return false;
    }
    return false;
  }

  //Función para revisar si el usuario está en la pantalla correcta
  Future<void> checkLogin(BuildContext context, int actual) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? nombre = sp.getString('nombre');
    if (nombre != null) {
      int? privilegios = sp.getInt('privilegios');
      if (privilegios == 1 && privilegios != actual) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminPage()));
      } else if (privilegios == 2 && privilegios != actual) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ObrasPage()));
      }
    } else {
      Navigator.pushNamed(context, LoginScreen.id);
    }
  }

  //Función para eliminar variables de shared preferences
  Future<void> eraseUsrData(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('id');
    sp.remove('nombre');
    sp.remove('privilegios');
    sp.remove('puesto');
    sp.remove('departamento');
    sp.remove('email');
    sp.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  //Función para abrir un PDF en movil
  void openPDF(String rubro, String identificador) async {
    try {
      final Directory? pathSD = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationSupportDirectory();
      var finalPath = pathSD!.path + "/Plantilla/$rubro/$identificador.pdf";
      OpenFile.open(finalPath);
    } catch (e) {
      print('No existe el archivo');
    }
  }

  //Petición para obtener todas las obras activas
  Future<List<ProyectosUsuarioModel>> obtenerObras() async {
    var url =
        Uri.parse(domain + "/api/Proyectos//api/Proyectos/MostarObrasActivas");
    var response = await http.get(url);
    var list = json.decode(response.body) as List<dynamic>;
    return list.map((e) => ProyectosUsuarioModel.fromJson(e)).toList();
  }

  //Petición para obtener los pdf de internet
  Future obtenerPDFs() async {
    var url = Uri.parse(domain + "/api/Archivos/ObtenerCatalogo");
    var response = await http.get(url);
    var list = json.decode(response.body) as List<dynamic>;
    List<dynamic> mapeo =
        list.map((e) => ArchivosCatalogModel.fromJson(e)).toList();
    for (var obra in mapeo) {
      //print(obra.id);
      //print(obra.nombre);
      //print(obra.rubro);
      //print(obra.identificador);
      int id = obra.id;
      var urlfile = Uri.parse(domain + "/api/archivos/obtenerarchivo");
      var responsefile = await http.post(
        urlfile,
        headers: {"Content-type": "application/json"},
        body: '{"id": $id}',
      );
      //Crear el archivo con response.body
      final Directory? pathSD = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationSupportDirectory(); // Aqui obtenemos el directorio donde se guarda la info de la app
      var finalPath =
          pathSD!.path + "/Plantilla/${obra.rubro}/${obra.identificador}.pdf";
      //Aqui concatenamos el path del directorio con el nombre del archivo

      String fileString = responsefile.body.replaceAll('"', "");
      var bytes = base64Decode(fileString);
      File archivo = File(finalPath);
      await archivo.create(recursive: true);
      archivo.writeAsBytes(bytes.buffer.asUint8List());
    }
  }

  Future subirPDF(String rubro, String identificador, String idObra) async {
    //archivo
    //rubro - id del documento a subir en la plantilla o catalogo
    //idusuario
    //idobra
    //nombre
    //ExtendSelectionUpTextIntentsize
    SharedPreferences sp = await SharedPreferences.getInstance();

    //Ruta de api
    var url = Uri.parse(domain + "/api/Archivos/SubirArchivo");
    //Tipo de petición
    var request = http.MultipartRequest("POST", url);
    //Directorio del archivo
    final Directory? pathSD = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    var finalPath = pathSD!.path + "/Plantilla/$rubro/$identificador.pdf";

    //Ruta de api para obtener el catálogo y luego obtener el id del rubro
    var urlCatalogo = Uri.parse(domain + "/api/Archivos/ObtenerCatalogo");
    var responseCatalogo = await http.get(urlCatalogo);
    var list = json.decode(responseCatalogo.body) as List<dynamic>;
    List<dynamic> catalogo =
        list.map((e) => ArchivosCatalogModel.fromJson(e)).toList();
    final idRubro = catalogo.firstWhere((element) =>
        element.rubro == rubro && element.identificador == identificador);
    print(idRubro.id);
    var multipartFile = await http.MultipartFile.fromPath("archivo", finalPath);
    var multipartRubro = http.MultipartFile.fromString("rubro", idRubro.id);
    var multipartId =
        http.MultipartFile.fromString("usauario", sp.getInt('id').toString());
    var multipartIdObra = http.MultipartFile.fromString("obra", idObra);
    request.files.add(multipartFile);
    request.files.add(multipartRubro);
    request.files.add(multipartId);
    request.files.add(multipartIdObra);

    http.StreamedResponse response = await request.send();
    response.stream.transform(utf8.decoder).listen(
      (value) {
        print(value);
      },
    );
  }
}
