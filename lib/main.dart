import 'package:flutter/material.dart';

import 'theme/zentro_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ZentroApp());
}

class ZentroApp extends StatelessWidget {
  const ZentroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zentro',
      theme: ZentroTheme.lightTheme,
      darkTheme: ZentroTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}