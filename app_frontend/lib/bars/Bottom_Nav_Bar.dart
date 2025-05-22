import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF0D1B2A),
      
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color:Color(0xFFE0E1DD)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task, color:Color(0xFFE0E1DD),),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color:Color(0xFFE0E1DD)),
          label: 'Profile',
        ),
      ],
    );
  }
}
