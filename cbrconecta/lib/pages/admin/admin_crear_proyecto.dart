import 'package:flutter/material.dart';

class CrearProyectoPage extends StatefulWidget {
  const CrearProyectoPage({Key? key}) : super(key: key);

  @override
  State<CrearProyectoPage> createState() => _CrearProyectoPageState();
}

class _CrearProyectoPageState extends State<CrearProyectoPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numProyectoCtrl = TextEditingController();
  TextEditingController beginDateCtrl = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    numProyectoCtrl.dispose();
    beginDateCtrl.dispose();
    endDateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF01579B),
        title: const Text('Crear proyecto'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(60.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextBox(
                  controller: nameCtrl,
                  label: 'Nombre del proyecto',
                ),
                TextBox(
                  controller: numProyectoCtrl,
                  label: 'Número de proyecto',
                ),
                TextBox(
                  controller: beginDateCtrl,
                  label: 'Fecha de inicio',
                ),
                TextBox(
                  controller: endDateCtrl,
                  label: 'Fecha de término',
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width * 0.4, 40.0),
                          primary: const Color(0xff35AC50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                        ),
                        onPressed: () {
                          //
                        },
                        icon: const Icon(Icons.picture_as_pdf),
                        label: const Text('Adjuntar documento'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width * 0.4, 40.0),
                          primary: const Color(0xff0a9396),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                        ),
                        onPressed: () {
                          //
                        },
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Abrir documento'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _bottomSend(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomSend(Size size) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(size.width * 0.8, 60.0),
            primary: const Color(0xff2196F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60.0),
            ),
          ),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text(
              'Crear',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onPressed: () {
            save();
          },
        );
      },
    );
  }

  save() {
    if (_formKey.currentState!.validate()) {
      print("Nombre completo ${nameCtrl.text}");
      print("Número de proyecto ${numProyectoCtrl.text}");
      print("Fecha de inicio ${beginDateCtrl.text}");
      print("Fecha de término ${endDateCtrl.text}");
      _formKey.currentState!.reset();
    }
  }
}

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
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'El $label es necesario';
        }
      },
    );
  }
}
