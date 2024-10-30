import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomFooter({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 70,
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIcon(Icons.book_outlined, 0, '/home'),
              _buildIcon(Icons.shopping_bag_outlined, 1, '/userFavorites'),
              SizedBox(width: 40), // Espacio para el botón central
              _buildIcon(Icons.favorite_outline, 3, '/messages'),
              _buildIcon(Icons.person_outline, 4, '/profile'),
            ],
          ),
        ),
        Positioned(
          bottom: 35,
          child: FloatingActionButton(
            backgroundColor: currentIndex == 2 ? Colors.orange : Colors.grey,
            elevation: 5,
            child: Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => onTap(2),
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon, int index, String route) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.orange.withOpacity(0.2) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: currentIndex == index ? Colors.orange : Colors.black,
          size: 28,
        ),
      ),
    );
  }
}
