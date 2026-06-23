import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen_solo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _AuthBackground(
        childBuilder: (context, screenWidth, screenHeight) {
          final logoPinSize =
              (screenWidth * 0.24).clamp(72.0, 96.0).toDouble();
          final logoTextSize =
              (screenWidth * 0.32).clamp(100.0, 128.0).toDouble();
          final titleSize =
              (screenWidth * 0.085).clamp(28.0, 34.0).toDouble();
          final buttonHeight =
              (screenHeight * 0.065).clamp(52.0, 58.0).toDouble();

          return Column(
            children: [
              _BackButton(),

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
                'Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: zentroBlue,
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              const _ZentroTextField(
                icon: Icons.email_outlined,
                hint: 'Email Address',
              ),

              SizedBox(height: screenHeight * 0.022),

              const _ZentroTextField(
                icon: Icons.lock_outline,
                hint: 'Password',
                obscureText: true,
              ),

              SizedBox(height: screenHeight * 0.035),

              _ZentroButton(
                text: 'Login',
                height: buttonHeight,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreenSolo(),
                    ),
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.018),

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
          );
        },
      ),
    );
  }
}

class _AuthBackground extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) childBuilder;

  const _AuthBackground({required this.childBuilder});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                          child: childBuilder(
                            context,
                            screenWidth,
                            screenHeight,
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
    );
  }
}

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}

class _ZentroTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscureText;

  const _ZentroTextField({
    required this.icon,
    required this.hint,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: LoginScreen.zentroBlue,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
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