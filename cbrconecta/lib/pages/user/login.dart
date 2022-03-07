// ignore_for_file: deprecated_member_use

import 'package:cbrconecta/pages/admin/admin_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cbrconecta/widgets/background.dart';
import 'package:cbrconecta/utils/requests.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cbrconecta/utils/requests.dart';

import 'mis_obras.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_page';

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final userCtrlr = TextEditingController();
  final passCtrlr = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    userCtrlr.dispose();
    passCtrlr.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: checkLogin(),
      builder: (context, data) {
        if (data.hasError) {
          return const Text("Ocurrió un error al cargar la información");
        } else if (data.hasData) {
          //Obtiene el valor que se obtuvo, puede ser falso o verdadero
          Object? result = data.data;
          //Si es verdaero debe redirigir a su pantalla apropiada
          if (result == true) {
            loadScreen(context);
            return const CircularProgressIndicator();
          } else //Si es falso carga la pantalla de login
          {
            return Scaffold(
              body: Background(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: const Text(
                        "INICIAR SESIÓN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF1A237E),
                            fontSize: 26),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: userCtrlr,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(labelText: "Usuario"),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: passCtrlr,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          labelText: "Contraseña",
                        ),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: GestureDetector(
                        onTap: () => {},
                        child: const Text(
                          "Recuperar contraseña",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(207, 150, 16, 1)),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: RaisedButton(
                        onPressed: () {
                          login(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 255, 136, 34),
                                Color.fromARGB(255, 255, 177, 41)
                              ])),
                          padding: const EdgeInsets.all(0),
                          child: const Text(
                            "Iniciar sesión",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }
      },
    );
  }

  Future<void> login(BuildContext context) async {
    try {
      if (userCtrlr.text.isNotEmpty && passCtrlr.text.isNotEmpty) {
        Requests req = Requests();
        SharedPreferences sp = await SharedPreferences.getInstance();
        bool resu = await req.login(userCtrlr.text, passCtrlr.text);
        if (resu) {
          print(sp.getInt('privilegios'));
          if (sp.getInt('privilegios') == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AdminPage()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ObrasPage()));
          }
        } else {
          showCupertinoDialog(context: context, builder: createDialog);
        }
      }
    } catch (e) {
      print("Excepción: " + e.toString());
    }
  }

  Future<bool> checkLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? nombre = sp.getString('nombre');
    if (nombre != null) {
      return true;
    } else {
      return false;
    }
  }

  Widget createDialog(BuildContext context) => CupertinoAlertDialog(
        title: const Text("Datos incorrectos"),
        content: const Text("Revisa tu usuario o contraseña"),
        actions: [
          CupertinoDialogAction(
            child: const Text("Aceptar"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      );

  Future<void> loadScreen(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int? privilegios = sp.getInt('privilegios');
    if (privilegios == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ObrasPage()));
    }
  }
}
