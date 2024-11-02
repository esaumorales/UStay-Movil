// user_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:myapp/core/utils/navigation_utils.dart';
import 'package:myapp/core/widgets/custom_footer.dart';
import 'package:myapp/core/widgets/custom_header.dart';
import 'package:myapp/presentation/user/screens/user_bag_screen.dart';
import 'package:myapp/presentation/user/screens/user_favorite_screen.dart';
import 'package:myapp/presentation/user/screens/user_navigator_screen.dart';
import 'package:myapp/presentation/user/screens/user_person_screen.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  int _currentIndex = 2;

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
        title: "Dashboard",
        onNotificationTap: () {},
        onGridTap: () {},
        onSearchTap: () {},
        onTuneTap: () {},
      ),
      body: Center(
        child: Text("Bienvenido al dashboard."),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onIconTap,
      ),
    );
  }
}
