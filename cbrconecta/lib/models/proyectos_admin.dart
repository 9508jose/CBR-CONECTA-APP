class ProyectosAdminModel {
  int? id;
  String? nombre;
  String? fechaInicio;
  String? destajo;
  String? documento;
  String? estatus;

  ProyectosAdminModel({
    this.id,
    this.nombre,
    this.fechaInicio,
    this.destajo,
    this.documento,
    this.estatus,
  });
  ProyectosAdminModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    fechaInicio = json['fechaInicio'];
    destajo = json['destajo'];
    documento = json['documento'];
    estatus = json['estatus'];
  }
}
