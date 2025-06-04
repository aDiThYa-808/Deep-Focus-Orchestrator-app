import 'package:app_frontend/bars/bottom_nav_bar.dart';
import 'package:app_frontend/bars/top_nav_bar.dart';
import 'package:app_frontend/screens/chat_screen.dart';
import 'package:app_frontend/screens/home_screen.dart';
import 'package:app_frontend/screens/sessions_screen.dart';
import 'package:app_frontend/screens/stats_screen.dart';
import 'package:app_frontend/screens/login_screen.dart'; // Add your login screen
import 'package:app_frontend/screens/splash_screen.dart'; // Add your splash screen
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Make sure Firebase is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App Frontend",
      routes: {
        '/home': (context) => const MainAppUI(),
        '/login': (context) => const LoginScreen(),
      },
      home: const SplashScreen(), // Start with splash screen
    );
  }
}

/// Main App UI after login
class MainAppUI extends StatefulWidget {
  const MainAppUI({super.key});

  @override
  State<MainAppUI> createState() => _MainAppUIState();
}

class _MainAppUIState extends State<MainAppUI> {
  int selectedIndex = 0;

  final List<Widget> Pages = [
    const HomeScreen(),
    const SessionsScreen(),
    const StatsScreen(),
    const ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNav(),
      body: Pages[selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
