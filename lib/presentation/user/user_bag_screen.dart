import 'package:flutter/material.dart';
import 'package:myapp/core/utils/navigation_utils.dart';
import 'package:myapp/core/widgets/custom_header.dart';
import 'package:myapp/core/widgets/custom_footer.dart';
import 'package:myapp/presentation/user/user_dashboard_screen.dart';
import 'package:myapp/presentation/user/user_favorite_screen.dart';
import 'package:myapp/presentation/user/user_navigator_screen.dart';
import 'package:myapp/presentation/user/user_person_screen.dart';

class UserBagScreen extends StatefulWidget {
  @override
  _UserBagScreenState createState() => _UserBagScreenState();
}

class _UserBagScreenState extends State<UserBagScreen> {
  int _currentIndex = 1; // Ícono de "Bag" como seleccionado

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
        title: "Bag",
        onNotificationTap: () {},
        onGridTap: () {},
        onSearchTap: () {},
        onTuneTap: () {},
      ),
      body: Center(
        child: Text("Aquí irán los artículos de la bolsa"),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }
}
