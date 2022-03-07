class ArchivosCatalogModel {
  int? id;
  String? nombre;
  String? extension;
  double? size;
  String? ubicacion;
  String? rubro;
  String? identificador;

  ArchivosCatalogModel({
    this.id,
    this.nombre,
    this.extension,
    this.size,
    this.ubicacion,
    this.rubro,
    this.identificador,
  });
  ArchivosCatalogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    extension = json['extension'];
    size = json['size'];
    ubicacion = json['ubicacion'];
    rubro = json['rubro'];
    identificador = json['identificador'];
  }
}
