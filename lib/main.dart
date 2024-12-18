import 'package:flutter/material.dart';
import 'package:myapp/app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: SplashScreen(), // Pantalla de inicio o splash
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication(); // Verifica autenticación al iniciar
  }

  // Simulación de verificación de autenticación
  Future<void> _checkAuthentication() async {
    await Future.delayed(
        Duration(seconds: 2)); // Simula un retardo de 2 segundos

    bool isAuthenticated = await _isUserAuthenticated();
    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, AppRoutes.userDashboard);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.nonUserDashboard);
    }
  }

  // Simulación de autenticación: aquí deberías implementar la lógica real
  Future<bool> _isUserAuthenticated() async {
    // Aquí podrías consultar la autenticación real (por ejemplo, usando Firebase)
    return false; // Cambia esto según la autenticación
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Image.asset('assets/images/common/splash_screen_logo.png',
            width: 210, height: 168), // Logo de splash
      ),
    );
  }
}
