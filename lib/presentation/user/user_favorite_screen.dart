// lib/presentation/user/user_favorite_screen.dart
import 'package:flutter/material.dart';
import 'package:myapp/core/utils/navigation_utils.dart';
import 'package:myapp/presentation/user/user_bag_screen.dart';
import 'package:myapp/presentation/user/user_dashboard_screen.dart';
import 'package:myapp/core/widgets/custom_header.dart';
import 'package:myapp/core/widgets/custom_footer.dart';
import 'package:myapp/presentation/user/user_navigator_screen.dart';
import 'package:myapp/presentation/user/user_person_screen.dart';

class UserFavoriteScreen extends StatefulWidget {
  @override
  _UserFavoriteScreenState createState() => _UserFavoriteScreenState();
}

class _UserFavoriteScreenState extends State<UserFavoriteScreen> {
  int _currentIndex = 3; // Cambiamos el índice a 3 para el icono de favoritos

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Usa la función de navegación sin animación
    switch (index) {
      case 0:
        navigateWithoutAnimation(context, UserNavigatorScreen());
        break;
      case 1:
        navigateWithoutAnimation(context, UserBagScreen());
        break;
      case 2:
        navigateWithoutAnimation(context, UserDashboardScreen());
        break;
      case 3:
        navigateWithoutAnimation(context, UserFavoriteScreen()); // Pantalla actual
        break;
      case 4:
        navigateWithoutAnimation(context, UserPersonScreen());
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
