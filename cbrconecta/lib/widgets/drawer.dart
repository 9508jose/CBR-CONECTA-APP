import 'package:cbrconecta/utils/requests.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnDrawer extends StatelessWidget {
  const OwnDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff5590BD), Color(0xff8EB5D3)]),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/images/logo_max.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: getNombre(),
            builder: (context, data) {
              if (data.hasError) {
                return Text("Ocurrió un error al cargar el nombre:" +
                    data.error.toString());
              } else if (data.hasData) {
                var items = data.data;
                return ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Color(0xff264472),
                  ),
                  title: Text("Usuario: " + items.toString()),
                );
              } else {
                return Row(
                  children: const [
                    Expanded(
                      child: LinearProgressIndicator(
                        minHeight: 20,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          FutureBuilder(
            future: getPuesto(),
            builder: (context, data) {
              if (data.hasError) {
                return Text("Ocurrió un error al cargar el nombre:" +
                    data.error.toString());
              } else if (data.hasData) {
                var items = data.data;
                return ListTile(
                  leading: const Icon(
                    Icons.supervised_user_circle,
                    color: Color(0xff264472),
                  ),
                  title: Text("Puesto: " + items.toString()),
                );
              } else {
                return Row(
                  children: const [
                    Expanded(
                      child: LinearProgressIndicator(
                        minHeight: 20,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          FutureBuilder(
            future: getDep(),
            builder: (context, data) {
              if (data.hasError) {
                return Text("Ocurrió un error al cargar el nombre:" +
                    data.error.toString());
              } else if (data.hasData) {
                var items = data.data;
                return ListTile(
                  leading: const Icon(
                    Icons.store,
                    color: Color(0xff264472),
                  ),
                  title: Text("Departamento: " + items.toString()),
                );
              } else {
                return Row(
                  children: const [
                    Expanded(
                      child: LinearProgressIndicator(
                        minHeight: 20,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          const Divider(
            color: Color(0Xff002643),
            height: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Color(0xff264472),
            ),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Requests req = Requests();
              req.eraseUsrData(context);
              //Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: Color(0xff264472),
            ),
            title: const Text('Ayuda'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Future getNombre() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? dato = sp.getString("nombre");
    return dato as String;
  }

  Future getPuesto() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? dato = sp.getString("puesto");
    return dato as String;
  }

  Future getDep() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? dato = sp.getString("departamento");
    return dato as String;
  }
}
