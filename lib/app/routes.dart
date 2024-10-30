import 'package:flutter/material.dart';
import 'package:myapp/presentation/authentication/login_screen.dart';
import 'package:myapp/presentation/user/user_dashboard_screen.dart';
import 'package:myapp/presentation/user/user_favorite_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String userDashboard = '/userDashboard';
  static const String userFavorite = '/userFavorite';
  static const String partnerDashboard = '/partnerDashboard';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case userDashboard:
        return MaterialPageRoute(builder: (_) => UserDashboardScreen());
      case AppRoutes.userFavorite:
        return MaterialPageRoute(builder: (_) => UserFavoriteScreen());
      // case partnerDashboard:
      // return MaterialPageRoute(builder: (_) => PartnerDashboardScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
