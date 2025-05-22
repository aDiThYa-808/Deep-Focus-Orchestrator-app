import "package:app_frontend/bars/Top_Nav_Bar.dart";
import "package:app_frontend/bars/Bottom_Nav_Bar.dart";
import "package:app_frontend/screens/home_screen.dart";
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Root widget
      home: Scaffold(
        appBar: const TopNav(),


        bottomNavigationBar: BottomNavBar(),
      )
    );
  }
}
