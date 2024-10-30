// lib/presentation/user/user_favorite_screen.dart
import 'package:flutter/material.dart';
import 'package:myapp/core/utils/navigation_utils.dart'; // Importa la función de navegación
import 'package:myapp/presentation/user/user_dashboard_screen.dart';
import 'package:myapp/core/widgets/custom_header.dart';
import 'package:myapp/core/widgets/custom_footer.dart';

class UserFavoriteScreen extends StatefulWidget {
  @override
  _UserFavoriteScreenState createState() => _UserFavoriteScreenState();
}

class _UserFavoriteScreenState extends State<UserFavoriteScreen> {
  int _currentIndex = 1;

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Usa la función de navegación sin animación
    switch (index) {
      case 0:
        // navigateWithoutAnimation(context, HomeScreen()); // Cambia a la pantalla que deseas
        break;
      case 1:
        navigateWithoutAnimation(context, UserFavoriteScreen());
        break;
      case 2:
        navigateWithoutAnimation(context, UserDashboardScreen());
        break;
      case 3:
        // navigateWithoutAnimation(context, MessagesScreen()); // Cambia a la pantalla que deseas
        break;
      case 4:
        // navigateWithoutAnimation(context, ProfileScreen()); // Cambia a la pantalla que deseas
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: "Favorites",
        onNotificationTap: () {},
        onGridTap: () {},
        onSearchTap: () {},
        onTuneTap: () {},
      ),
      body: Center(
        child: Text("Aquí irán las Cards de Favoritos"),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }
}
