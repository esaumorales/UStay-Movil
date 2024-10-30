import 'package:flutter/material.dart';
import 'package:myapp/core/utils/navigation_utils.dart';
import 'package:myapp/core/widgets/custom_header.dart';
import 'package:myapp/core/widgets/custom_footer.dart';
import 'package:myapp/presentation/user/user_dashboard_screen.dart';
import 'package:myapp/presentation/user/user_favorite_screen.dart';
import 'package:myapp/presentation/user/user_navigator_screen.dart';
import 'package:myapp/presentation/user/user_bag_screen.dart';

class UserPersonScreen extends StatefulWidget {
  @override
  _UserPersonScreenState createState() => _UserPersonScreenState();
}

class _UserPersonScreenState extends State<UserPersonScreen> {
  int _currentIndex = 4; // Ícono de "Person" como seleccionado

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });
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
        navigateWithoutAnimation(context, UserFavoriteScreen());
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
        title: "Profile",
        onNotificationTap: () {},
        onGridTap: () {},
        onSearchTap: () {},
        onTuneTap: () {},
      ),
      body: Center(
        child: Text("Aquí irán los detalles del perfil del usuario"),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }
}
