import 'package:flutter/material.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  const TopNav({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1B263B),
      title: const Text(
        'Deep Focus',
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFFE0E1DD)),
      ),
      centerTitle: true,
    );
  }
}
