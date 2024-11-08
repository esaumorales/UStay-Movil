import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:myapp/domain/entities/partner.dart';
import 'package:myapp/domain/entities/room.dart';
import 'package:myapp/domain/entities/user.dart';
import 'package:path_provider/path_provider.dart';

class DataService {
  // Obtiene la ruta del archivo en el directorio de documentos
  Future<String> _getDocumentPath(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$filename';
  }

  // Carga los datos de un archivo JSON específico y copia de `assets` si no existe
  Future<List<dynamic>> _loadJsonData(String path) async {
    final filePath = await _getDocumentPath(path);
    final file = File(filePath);

    // Si el archivo no existe en el directorio de documentos, cópialo desde `assets`
    if (!file.existsSync()) {
      final String assetData = await rootBundle.loadString('assets/data/$path');
      await file.writeAsString(assetData);
    }

    final String response = await file.readAsString();
    return json.decode(response);
  }

  // Autenticación: carga `usuario.json` y busca el usuario
  Future<User?> authenticate(String email, String password) async {
    try {
      final List<dynamic> usuariosData = await _loadJsonData('usuario.json');
      final List<dynamic> personasData = await _loadJsonData('persona.json');

      print('Usuarios cargados: $usuariosData');
      print('Personas cargadas: $personasData');
      print('Email buscado: $email');
      print('Contraseña buscada: $password');

      String emailLower = email.trim().toLowerCase();
      String passwordTrimmed = password.trim();

      final userJson = usuariosData.firstWhere((user) {
        String userCorreo = user['correo']?.trim()?.toLowerCase() ?? '';
        String userContrasena = user['contrasena']?.trim() ?? '';

        print(
            "Comparando con correo en JSON: $userCorreo y contraseña en JSON: $userContrasena");
        return userCorreo == emailLower && userContrasena == passwordTrimmed;
      }, orElse: () => null);

      if (userJson == null) {
        print(
            "Usuario no encontrado con el correo y contraseña proporcionados.");
        return null;
      }

      final personaJson = personasData.firstWhere(
        (persona) => persona['id_persona'] == userJson['persona']['id_persona'],
        orElse: () => null,
      );

      if (personaJson == null) {
        print("Persona asociada no encontrada.");
        return null;
      }

      print("Usuario encontrado y autenticado con éxito.");
      return User.fromJson({
        ...userJson,
        'persona': personaJson,
      });
    } catch (e) {
      print("Error en la autenticación: $e");
      return null;
    }
  }

  // Registra un nuevo usuario y persona
  Future<void> registerUser(User newUser) async {
    final usuarioPath = await _getDocumentPath('usuario.json');
    final personaPath = await _getDocumentPath('persona.json');

    final List<dynamic> usuarios = await _loadJsonData('usuario.json');
    final List<dynamic> personas = await _loadJsonData('persona.json');

    final newPersonId = DateTime.now().millisecondsSinceEpoch;
    final userId = newPersonId;

    final personaData = {
      'id_persona': newPersonId,
      'nombre': newUser.persona.nombre,
      'apellido_paterno': newUser.persona.apellidoPaterno,
      'apellido_materno': newUser.persona.apellidoMaterno,
      'fecha_registro': newUser.persona.fechaRegistro.toIso8601String(),
    };
    personas.add(personaData);

    final userData = {
      'id_usuario': userId,
      'correo': newUser.correo,
      'contrasena': newUser.password,
      'persona': personaData,
    };
    usuarios.add(userData);

    await File(personaPath).writeAsString(json.encode(personas));
    await File(usuarioPath).writeAsString(json.encode(usuarios));
  }

  //Partner
  Future<List<Partner>> fetchPartners() async {
    final String response =
        await rootBundle.loadString('assets/data/partner.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Partner.fromJson(json)).toList();
  }

  //Room
  Future<List<Room>> fetchRooms() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/cuarto.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Room.fromJson(json)).toList();
    } catch (e) {
      print("Error al cargar rooms: $e");
      return [];
    }
  }
}
