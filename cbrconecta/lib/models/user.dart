class UserDataModel {
  int? id;
  String? nombre;
  String? usuario;
  String? privilegio;
  String? puesto;
  String? departamento;
  String? email;

  UserDataModel(
      {this.id,
      this.nombre,
      this.usuario,
      this.privilegio,
      this.puesto,
      this.departamento,
      this.email});
  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    usuario = json['usuario'];
    privilegio = json['privilegio'];
    puesto = json['puesto'];
    departamento = json['departamento'];
    email = json['email'];
  }
}
