class Partner {
  final int id;
  final String nombreEmpresa;
  final String ruc;
  final String direccion;
  final String telefono;
  final String email;

  Partner({
    required this.id,
    required this.nombreEmpresa,
    required this.ruc,
    required this.direccion,
    required this.telefono,
    required this.email,
  });

  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
      id: json['id_partner'],
      nombreEmpresa: json['nombre_empresa'],
      ruc: json['ruc'],
      direccion: json['direccion_empresa'],
      telefono: json['telefono_empresa'],
      email: json['email_empresa'],
    );
  }
}
