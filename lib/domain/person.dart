class Person {
  final int id;
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final DateTime fechaRegistro;

  Person({
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.fechaRegistro,
  });

  // Constructor para crear una instancia desde JSON
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id_persona'],
      nombre: json['nombre'],
      apellidoPaterno: json['apellido_paterno'],
      apellidoMaterno: json['apellido_materno'],
      fechaRegistro: DateTime.parse(json['fecha_registro']),
    );
  }

  // Convierte la instancia en JSON
  Map<String, dynamic> toJson() {
    return {
      'id_persona': id,
      'nombre': nombre,
      'apellido_paterno': apellidoPaterno,
      'apellido_materno': apellidoMaterno,
      'fecha_registro': fechaRegistro.toIso8601String(),
    };
  }
}
