import 'package:app_frontend/screens/home_screen.dart';
import 'package:app_frontend/screens/sessions_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        //splashColor: Colors.transparent,
      ),

      child: BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        onTap: widget.onItemTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Color(0xFF0E0E0E),
        selectedItemColor: Color(0xFFFFFFFF),
        unselectedItemColor: Color(0xFF8E8E93),
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_rounded, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded, size: 25),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.query_stats_rounded, size: 25),
            label: 'Profile',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded, size: 25),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
