import 'package:cbrconecta/pages/admin/admin_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/user/mis_obras.dart';
import 'utils/requests.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CBRConecta',
      theme: ThemeData(
        primaryColor: const Color(0xff0167AE),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  void dispose() {
    userCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _checkSession(),
          builder: (context, data) {
            if (data.hasData) {
              Object? result = data.data;
              if (result == false) {
                return Form(
                  key: _formKey,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.2, 0.5, 0.8, 0.7],
                        colors: [
                          Color(0XFFE3F2FD),
                          Color(0XFFBBDEFB),
                          Color(0XFF90CAF9),
                          Color(0XFF64B5F6)
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: size.height,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          height: size.height * 0.4,
                          top: 0,
                          right: 0,
                          child: Image.asset("assets/images/logo.png",
                              width: size.width * 0.5),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
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
                            TextBox(
                              controller: userCtrl,
                              label: 'Usuario',
                            ),
                            SizedBox(height: size.height * 0.03),
                            TextBox(
                              controller: passCtrl,
                              label: 'Contraseña',
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 15),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Recuperar contraseña",
                                  style: TextStyle(
                                    color: Color(0xff0167AE),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.05),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: _bottomLogin(size),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                _loadUserPage(context);
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else if (data.hasError) {
              return const Text("Ocurrió un error al cargar la información");
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  //Método para crear el botón Login
  Widget _bottomLogin(size) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          onPressed: () {
            _login();
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(size.width * 0.5, 50.0),
            primary: const Color.fromARGB(255, 255, 136, 34),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            child: const Text(
              "Iniciar sesión",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  //Método para hacer realizar el Login
  Future _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        if (userCtrl.text.isNotEmpty && passCtrl.text.isNotEmpty) {
          Requests req = Requests();
          SharedPreferences sp = await SharedPreferences.getInstance();
          bool resu = await req.login(userCtrl.text, passCtrl.text);
          if (resu) {
            if (sp.getInt('privilegios') == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminPage()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ObrasPage()));
            }
          } else {
            showCupertinoDialog(context: context, builder: _createDialog);
          }
        }
      } catch (e) {
        print("Excepción: " + e.toString());
      }
    }
  }

  //Método para lanzar un MessageBox o alert
  Widget _createDialog(BuildContext context) => CupertinoAlertDialog(
        title: const Text("Datos incorrectos"),
        content: const Text("Revisa tu usuario o contraseña"),
        actions: [
          CupertinoDialogAction(
            child: const Text("Aceptar"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      );

  Future<bool> _checkSession() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? nombre = sp.getString('nombre');
    if (nombre != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _loadUserPage(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int? privilegios = sp.getInt('privilegios');
    if (privilegios == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AdminPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ObrasPage()));
    }
  }
}

//Clase para escribir los TextField
class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'El $label es necesario';
          }
        },
      ),
    );
  }
}
