import 'package:myapp/domain/person.dart';

class User {
  final int id;
  final String correo;
  final String password;
  final Person persona;

  User({
    required this.id,
    required this.correo,
    required this.password,
    required this.persona,
  });

  // Constructor para crear una instancia desde JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id_usuario'],
      correo: json['correo'],
      password: json['contrasena'],
      persona: Person.fromJson(json['persona']),
    );
  }

  // Convierte la instancia en JSON
  Map<String, dynamic> toJson() {
    return {
      'id_usuario': id,
      'correo': correo,
      'contrasena': password,
      'persona': persona.toJson(),
    };
  }
}
