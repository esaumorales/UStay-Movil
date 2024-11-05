import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:myapp/domain/user.dart';

class DataService {
  // Carga los datos de un archivo JSON específico
  Future<List<dynamic>> _loadJsonData(String path) async {
    final String response = await rootBundle.loadString(path);
    return json.decode(response);
  }

  // Autenticación: carga `usuario.json` y busca el usuario
  Future<User?> authenticate(String email, String password) async {
    final List<dynamic> usuariosData =
        await _loadJsonData('assets/data/usuario.json');
    final List<dynamic> personasData =
        await _loadJsonData('assets/data/persona.json');

    try {
      // Encuentra el usuario en `usuario.json`
      final userJson = usuariosData.firstWhere(
        (user) => user['correo'] == email && user['contrasena'] == password,
      );

      // Encuentra la persona asociada en `persona.json`
      final personaJson = personasData.firstWhere(
        (persona) => persona['id_persona'] == userJson['persona']['id_persona'],
      );

      // Combina la información de usuario y persona
      return User.fromJson({
        ...userJson,
        'persona': personaJson,
      });
    } catch (e) {
      return null;
    }
  }

  // Registra un nuevo usuario y persona
  Future<void> registerUser(User newUser) async {
    // Cargar datos actuales
    final List<dynamic> usuarios =
        await _loadJsonData('assets/data/usuario.json');
    final List<dynamic> personas =
        await _loadJsonData('assets/data/persona.json');

    // Generar un nuevo ID para el usuario y la persona
    final newPersonId = DateTime.now().millisecondsSinceEpoch;
    final userId = newPersonId;

    // Crear los datos para la nueva persona
    final personaData = {
      'id_persona': newPersonId,
      'nombre': newUser.persona.nombre,
      'apellido_paterno': newUser.persona.apellidoPaterno,
      'apellido_materno': newUser.persona.apellidoMaterno,
      'fecha_registro': newUser.persona.fechaRegistro.toIso8601String(),
    };
    personas.add(personaData);

    // Crear los datos para el nuevo usuario
    final userData = {
      'id_usuario': userId,
      'correo': newUser.correo,
      'contrasena': newUser.password,
      'persona': personaData,
    };
    usuarios.add(userData);

    // Guardar los datos actualizados en los archivos respectivos
    await File('assets/data/persona.json').writeAsString(json.encode(personas));
    await File('assets/data/usuario.json').writeAsString(json.encode(usuarios));
  }
}
