import 'package:app_frontend/bars/Bottom_Nav_Bar.dart';
import 'package:app_frontend/bars/Top_Nav_Bar.dart';
import 'package:app_frontend/widgets/timer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNav(),

      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF121212),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [MainTimer()],
        ),
      ),

      bottomNavigationBar: BottomNavBar(),
    );
  }
}
