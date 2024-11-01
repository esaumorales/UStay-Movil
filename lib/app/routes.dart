import 'package:flutter/material.dart';
import 'package:myapp/presentation/authentication/login_screen.dart';
import 'package:myapp/presentation/authentication/registration_screen.dart';
import 'package:myapp/presentation/non_user/screens/non_user_bag_screen.dart';
import 'package:myapp/presentation/non_user/screens/non_user_dashboard_screen.dart';
import 'package:myapp/presentation/non_user/screens/non_user_favorite_screen.dart';
import 'package:myapp/presentation/non_user/screens/non_user_navigator_screen.dart';
import 'package:myapp/presentation/non_user/screens/non_user_person_screen.dart';
import 'package:myapp/presentation/user/screens/user_bag_screen.dart';
import 'package:myapp/presentation/user/screens/user_dashboard_screen.dart';
import 'package:myapp/presentation/user/screens/user_favorite_screen.dart';
import 'package:myapp/presentation/user/screens/user_navigator_screen.dart';
import 'package:myapp/presentation/user/screens/user_person_screen.dart';

class AppRoutes {
  static const String userDashboard = '/userDashboard';
  static const String userBag = '/userBag';
  static const String userFavorite = '/userFavorite';
  static const String userNavigator = '/userNavigator';
  static const String userPerson = '/userPerson';

  static const String login = '/login';
  static const String register = '/register';
  static const String nonUserDashboard = '/nonUserDashboard';
  static const String nonUserBag = '/nonUserBag';
  static const String nonUserFavorite = '/nonUserFavorite';
  static const String nonUserNavigator = '/nonUserNavigator';
  static const String nonUserPerson = '/nonUserPerson';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Rutas de usuario registrado
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

      // Rutas de usuario no registrado
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterStepOneScreen());
      case nonUserNavigator:
        return MaterialPageRoute(builder: (_) => NonUserNavigatorScreen());
      case nonUserBag:
        return MaterialPageRoute(builder: (_) => NonUserBagScreen());
      case nonUserDashboard:
        return MaterialPageRoute(builder: (_) => NonUserDashboardScreen());
      case nonUserFavorite:
        return MaterialPageRoute(builder: (_) => NonUserFavoriteScreen());
      case nonUserPerson:
        return MaterialPageRoute(builder: (_) => NonUserPersonScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Ruta no encontrada: ${settings.name}')),
          ),
        );
    }
  }
}
