class ProyectosUsuarioModel {
  int? id;
  String? nombre;

  ProyectosUsuarioModel({
    this.id,
    this.nombre,
  });
  ProyectosUsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
  }
}
