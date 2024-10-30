import 'package:flutter/material.dart';
import 'package:myapp/app/routes.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MyApp',
      initialRoute:
          AppRoutes.login, // Usamos el nombre de la ruta desde routes.dart
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false, // Configuramos generateRoute
    );
  }
}
