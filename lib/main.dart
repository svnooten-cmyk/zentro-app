import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zentro'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welkom bij Zentro',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Verhalen, reizen en ontmoetingen.',
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Registreren'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}