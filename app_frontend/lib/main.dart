import "package:app_frontend/bars/bottom_nav_bar.dart";
import "package:app_frontend/bars/top_nav_bar.dart";
import "package:app_frontend/screens/chat_screen.dart";
import "package:app_frontend/screens/home_screen.dart";
import "package:app_frontend/screens/sessions_screen.dart";
import "package:app_frontend/screens/stats_screen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  final List<Widget> Pages = [
    HomeScreen(),
    SessionsScreen(),
    StatsScreen(),
    ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: TopNav(),

        body: Pages[selectedIndex],

        bottomNavigationBar: BottomNavBar(
          selectedIndex: selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
