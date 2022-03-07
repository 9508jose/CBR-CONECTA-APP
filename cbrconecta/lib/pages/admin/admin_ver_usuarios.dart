import 'package:cbrconecta/pages/admin/admin_ver_proyectos.dart';
import 'package:cbrconecta/utils/requests.dart';
import 'package:flutter/material.dart';

class usuariosPage extends StatefulWidget {
  static String id = "usuarios_Page";
  @override
  State<usuariosPage> createState() => _usuariosPageState();
}

class _usuariosPageState extends State<usuariosPage> {
  @override
  Widget build(BuildContext context) {
    Requests req = Requests();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProyectosAdminPage()));
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0XFF01579B),
        title: const Text('Inicio - Usuarios'),
        centerTitle: true,
      ),
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
                  height: size.height * 0.2 - 27,
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
                      Text(
                        "Usuario",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Image.asset('assets/images/blank-profile-picture.png'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
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
                      children: const <Widget>[
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.account_circle_outlined,
                              size: 50.0,
                            ),
                            title: Text('Erick Avendaño'),
                            subtitle: Text('Obra de CBRCONECTA 1.'),
                            trailing: Icon(Icons.delete),
                            isThreeLine: true,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.account_circle_outlined,
                              size: 50.0,
                            ),
                            title: Text('Joshua Olivo'),
                            subtitle: Text('Obra de CBRCONECTA 1.'),
                            trailing: Icon(Icons.delete),
                            isThreeLine: true,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.account_circle_outlined,
                              size: 50.0,
                            ),
                            title: Text('Raúl Gonzales'),
                            subtitle: Text('Obra de CBRCONECTA 1.'),
                            trailing: Icon(Icons.delete),
                            isThreeLine: true,
                          ),
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
}

class btnObra extends StatelessWidget {
  final String text;
  const btnObra({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        RaisedButton(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
            //Navigator.pushNamed(context, ObraPage.id);
            //Navigator.pushNamed(context, NavObraPage.id);
          },
        ),
      ],
    );
  }
}
