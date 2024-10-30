import 'package:flutter/material.dart';
import 'package:myapp/core/utils/navigation_utils.dart';
import 'package:myapp/core/widgets/custom_header.dart';
import 'package:myapp/core/widgets/custom_footer.dart';
import 'package:myapp/presentation/user/user_dashboard_screen.dart';
import 'package:myapp/presentation/user/user_favorite_screen.dart';
import 'package:myapp/presentation/user/user_bag_screen.dart';
import 'package:myapp/presentation/user/user_person_screen.dart';

class UserNavigatorScreen extends StatefulWidget {
  @override
  _UserNavigatorScreenState createState() => _UserNavigatorScreenState();
}

class _UserNavigatorScreenState extends State<UserNavigatorScreen> {
  int _currentIndex = 0;

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        navigateWithoutAnimation(context, UserNavigatorScreen()); // Cambia a la pantalla que deseas
        break;
      case 1:
        navigateWithoutAnimation(context, UserBagScreen());
        break;
      case 2:
        navigateWithoutAnimation(context, UserDashboardScreen());
        break;
      case 3:
        navigateWithoutAnimation(context, UserFavoriteScreen()); // Cambia a la pantalla que deseas
        break;
      case 4:
        navigateWithoutAnimation(context, UserPersonScreen()); // Cambia a la pantalla que deseas
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: "Navigator",
        onNotificationTap: () {},
        onGridTap: () {},
        onSearchTap: () {},
        onTuneTap: () {},
      ),
      body: Center(
        child: Text("Aquí irán las opciones de navegación"),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }
}
