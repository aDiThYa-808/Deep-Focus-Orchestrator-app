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
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Color(0xFF121212),
      
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
    
        BottomNavigationBarItem(
          icon: Icon(
            Icons.timer_outlined, 
            color: Color(0xFFB2BCBD), 
            size: 25
            ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list_alt_rounded,
            color: Color(0xFFB2BCBD),
            size: 25,
          ),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.query_stats_rounded,
            color: Color(0xFFB2BCBD),
            size: 25,
          ),
          label: 'Profile',
        ),

        BottomNavigationBarItem(
          icon: Icon(
            Icons.queue_music_outlined,
            color: Color(0xFFB2BCBD),
            size: 25,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
