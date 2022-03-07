import 'package:cbrconecta/utils/requests.dart';
import 'package:flutter/material.dart';

class NavProyecPage extends StatelessWidget {
  static String id = 'nav_proyect';

  const NavProyecPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _lista = ['Item1', 'Item2', 'Item3'];
    String? _vistaDirProyec = 'Dirección del proyecto';
    String? _vistaProyec = 'Proyecto a explorar';
    Requests req = Requests();
    //req.checkLogin(context, 2);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        backgroundColor: const Color(0XFF01579B),
        title: const Text('Navegador de proyectos'),
      ),
      body: Center(
        child: Form(
          child: SizedBox(
            width: size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.vpn_key),
                    label: const Text("Abrir VPN"),
                    onPressed: () {},
                  ),
                ),
                DropdownButtonFormField(
                  items: _lista.map((String a) {
                    return DropdownMenuItem(
                      value: a,
                      child: Text(a),
                    );
                  }).toList(),
                  onChanged: (_value) => {
                    _vistaDirProyec = _value as String?,
                  },
                  hint: Text(_vistaDirProyec!),
                ),
                TextFormField(
                  controller: TextEditingController(),
                  readOnly: false,
                  validator: (value) =>
                      value == null ? "campo requerido" : null,
                  decoration: const InputDecoration(hintText: "Año"),
                ),
                TextFormField(
                  controller: TextEditingController(),
                  readOnly: false,
                  validator: (value) =>
                      value == null ? "campo requerido" : null,
                  decoration: const InputDecoration(hintText: "Tipo"),
                ),
                TextFormField(
                  controller: TextEditingController(),
                  readOnly: false,
                  validator: (value) =>
                      value == null ? "campo requerido" : null,
                  decoration: const InputDecoration(hintText: "Usuario"),
                ),
                TextFormField(
                  controller: TextEditingController(),
                  readOnly: false,
                  validator: (value) =>
                      value == null ? "campo requerido" : null,
                  decoration: const InputDecoration(hintText: "Contraseña"),
                ),
                DropdownButtonFormField(
                  items: _lista.map((String a) {
                    return DropdownMenuItem(
                      value: a,
                      child: Text(a),
                    );
                  }).toList(),
                  onChanged: (_value) => {
                    _vistaProyec = _value as String?,
                  },
                  hint: Text(_vistaProyec!),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () async {},
                      child: const Text("Navegar en el proyecto")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
