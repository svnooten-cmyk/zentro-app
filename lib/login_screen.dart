import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black54,
            ),
          ),

          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),

                      const Spacer(),

                      SvgPicture.asset(
                        'zentro_pin.svg',
                        width: 95,
                      ),

                      const SizedBox(height: 8),

                      SvgPicture.asset(
                        'zentro_tekst.svg',
                        width: 120,
                      ),

                      const SizedBox(height: 35),

                      const Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF00D4FF),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      TextField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFF00D4FF),
                          ),
                          hintText: 'Email Address',
                          hintStyle: const TextStyle(
                            color: Colors.white70,
                          ),
                          filled: true,
                          fillColor: Colors.white12,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextField(
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF00D4FF),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.white70,
                          ),
                          filled: true,
                          fillColor: Colors.white12,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: 280,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}