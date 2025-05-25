import 'package:app_frontend/theme/colors.dart';
import 'package:flutter/material.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  const TopNav({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: const Text(
        'Deep Focus',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors.secondaryTextColor
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu_rounded),
        color: AppColors.unselectedIconColor,
        iconSize: 30,
      ),
    );
  }
}
