import 'package:flutter/material.dart';
import 'welcome_screen.dart';

void main() {
  runApp(const ZentroApp());
}

class ZentroApp extends StatelessWidget {
  const ZentroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zentro',
      home: WelcomeScreen(),
    );
  }
}