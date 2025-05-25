import 'package:flutter/material.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Column(
        children: [

        ],
      ),

    
      floatingActionButton: FloatingActionButton(
        onPressed: (){},

        child: const Icon(Icons.add_rounded),
      ),
    
    );
  }
}