import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const Color zentroBlue = Color(0xFF00D4FF);

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
            child: Container(color: Colors.black54),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = constraints.maxWidth;
                final screenHeight = constraints.maxHeight;

                final contentWidth = screenWidth > 430 ? 430.0 : screenWidth;
                final horizontalPadding = screenWidth < 360 ? 22.0 : 30.0;

                final logoPinSize =
                    (screenWidth * 0.24).clamp(72.0, 96.0).toDouble();
                final logoTextSize =
                    (screenWidth * 0.32).clamp(100.0, 128.0).toDouble();
                final titleSize =
                    (screenWidth * 0.085).clamp(28.0, 34.0).toDouble();
                final subtitleSize =
                    (screenWidth * 0.045).clamp(16.0, 19.0).toDouble();
                final buttonHeight =
                    (screenHeight * 0.065).clamp(52.0, 58.0).toDouble();

                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: contentWidth),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: screenHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                const Spacer(),

                                SvgPicture.asset(
                                  'zentro_pin.svg',
                                  width: logoPinSize,
                                ),

                                SizedBox(height: screenHeight * 0.012),

                                SvgPicture.asset(
                                  'zentro_tekst.svg',
                                  width: logoTextSize,
                                ),

                                SizedBox(height: screenHeight * 0.045),

                                Text(
                                  'Welcome to Zentro',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: zentroBlue,
                                    fontSize: titleSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.015),

                                Text(
                                  'Stories, travel and connections.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: subtitleSize,
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.06),

                                _ZentroButton(
                                  text: 'Login',
                                  height: buttonHeight,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const LoginScreen(),
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(height: screenHeight * 0.025),

                                _ZentroButton(
                                  text: 'Sign Up',
                                  height: buttonHeight,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const SignupScreen(),
                                      ),
                                    );
                                  },
                                ),

                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ZentroButton extends StatelessWidget {
  final String text;
  final double height;
  final VoidCallback onPressed;

  const _ZentroButton({
    required this.text,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}