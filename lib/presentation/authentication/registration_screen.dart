import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/data_service.dart';
import 'package:myapp/domain/user.dart';
import 'package:myapp/domain/person.dart';

class RegisterStepOneScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/common/app-logo.png',
                height: 160,
                width: 160,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.orange,
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 2,
                    color: Colors.grey,
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey[300],
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Ingrese sus datos personales:",
                style: GoogleFonts.kadwa(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("Nombres", _firstNameController),
              SizedBox(height: 15),
              _buildTextField("Apellido paterno", _lastNameController),
              SizedBox(height: 15),
              _buildTextField("Apellido materno", _middleNameController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterStepTwoScreen(
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        middleName: _middleNameController.text,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadowColor: Colors.orangeAccent,
                  elevation: 5,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Siguiente",
                      style: GoogleFonts.mada(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Image.asset(
                      'assets/icons/icon-next.png',
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "o bien",
                style: GoogleFonts.inter(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              _buildSocialButton(
                "Continuar con Google",
                "assets/images/common/google-logo.png",
              ),
              SizedBox(height: 16),
              _buildSocialButton(
                "Continuar con Facebook",
                "assets/images/common/facebook-logo.png",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: GoogleFonts.inter(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, String asset) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Image.asset(asset, width: 20),
        label: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class RegisterStepTwoScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String middleName;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final DataService _dataService = DataService();

  RegisterStepTwoScreen({
    required this.firstName,
    required this.lastName,
    required this.middleName,
  });

  void _registerUser(BuildContext context) async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Las contraseñas no coinciden")),
      );
      return;
    }

    final newPerson = Person(
      id: DateTime.now().millisecondsSinceEpoch,
      nombre: firstName,
      apellidoPaterno: lastName,
      apellidoMaterno: middleName,
      fechaRegistro: DateTime.now(),
    );

    final newUser = User(
      id: newPerson.id,
      correo: _emailController.text,
      password: _passwordController.text,
      persona: newPerson,
    );

    await _dataService.registerUser(newUser);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Usuario registrado exitosamente")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/common/app-logo.png',
                height: 160,
                width: 160,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey[300],
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 2,
                    color: Colors.grey,
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.orange,
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Complete la última información:",
                style: GoogleFonts.kadwa(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Nombre: $firstName $lastName $middleName",
                style: GoogleFonts.inter(fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildTextField("Correo", _emailController),
              SizedBox(height: 15),
              _buildTextField("Ingrese contraseña", _passwordController,
                  obscureText: true),
              SizedBox(height: 15),
              _buildTextField("Repita contraseña", _confirmPasswordController,
                  obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _registerUser(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadowColor: Colors.orangeAccent,
                  elevation: 5,
                ),
                child: Text(
                  "Registrarme",
                  style: GoogleFonts.mada(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "o bien",
                style: GoogleFonts.inter(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              _buildSocialButton(
                "Continuar con Google",
                "assets/images/common/google-logo.png",
              ),
              SizedBox(height: 16),
              _buildSocialButton(
                "Continuar con Facebook",
                "assets/images/common/facebook-logo.png",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: GoogleFonts.inter(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, String asset) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Image.asset(asset, width: 20),
        label: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
