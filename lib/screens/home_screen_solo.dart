import 'package:flutter/material.dart';

class HomeScreenSolo extends StatelessWidget {
  const HomeScreenSolo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF07111F),
      body: SafeArea(
        child: Center(
          child: Text(
            'Home Solo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}