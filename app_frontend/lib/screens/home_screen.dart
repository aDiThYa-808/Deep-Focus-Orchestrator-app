import 'package:app_frontend/theme/colors.dart';
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
      backgroundColor:AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [MainTimer()],
      ),
    );
  }
}
