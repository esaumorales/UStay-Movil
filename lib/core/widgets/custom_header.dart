import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onGridTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onTuneTap;

  CustomHeader({
    Key? key,
    required this.title,
    this.onNotificationTap,
    this.onGridTap,
    this.onSearchTap,
    this.onTuneTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF0A2440),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/common/app-logo-dashboard.png',
            width: 150,
            height: 150,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon:
                        Icon(Icons.notifications_outlined, color: Colors.white),
                    onPressed: onNotificationTap,
                  ),
                  IconButton(
                    icon: Icon(Icons.grid_view, color: Colors.white),
                    onPressed: onGridTap,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: onSearchTap,
                  ),
                  IconButton(
                    icon: Icon(Icons.tune, color: Colors.white),
                    onPressed: onTuneTap,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Implementación de `PreferredSizeWidget` con el tamaño preferido de `AppBar`
  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
