import 'package:flutter/material.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  const TopNav({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF0A0A0A),
      title: const Text(
        'Deep Focus',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFFB2BCBD),
        ),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Color(0xFFB2BCBD),
          iconSize: 30,
        ),
    );
  }
}
