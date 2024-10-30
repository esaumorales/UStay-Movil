import 'package:flutter/material.dart';
import 'package:myapp/presentation/authentication/login_screen.dart';
import 'package:myapp/presentation/user/user_bag_screen.dart';
import 'package:myapp/presentation/user/user_dashboard_screen.dart';
import 'package:myapp/presentation/user/user_favorite_screen.dart';
import 'package:myapp/presentation/user/user_navigator_screen.dart';
import 'package:myapp/presentation/user/user_person_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String userDashboard = '/userDashboard';
  static const String userFavorite = '/userFavorite';
  static const String userBag = '/userBag';
  static const String userPerson = '/userPerson';
  static const String userNavigator = '/userNavigator';
  static const String partnerDashboard = '/partnerDashboard';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case userNavigator:
        return MaterialPageRoute(builder: (_) => UserNavigatorScreen());
      case userBag:
        return MaterialPageRoute(builder: (_) => UserBagScreen());
      case userDashboard:
        return MaterialPageRoute(builder: (_) => UserDashboardScreen());
      case userFavorite:
        return MaterialPageRoute(builder: (_) => UserFavoriteScreen());
      case userPerson:
        return MaterialPageRoute(builder: (_) => UserPersonScreen());
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
