import 'package:app_frontend/bars/bottom_nav_bar.dart';
import 'package:app_frontend/bars/top_nav_bar.dart';
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
    return Container(
      decoration: BoxDecoration(color: Color(0xFF0E0E0E)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [MainTimer()],
      ),
    );
  }
}
