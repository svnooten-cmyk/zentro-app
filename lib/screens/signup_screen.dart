import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'create_profile_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool acceptedTerms = false;
  bool acceptedPrivacy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _AuthBackground(
        childBuilder: (context, screenWidth, screenHeight) {
          final logoPinSize =
              (screenWidth * 0.20).clamp(62.0, 88.0).toDouble();
          final logoTextSize =
              (screenWidth * 0.28).clamp(92.0, 120.0).toDouble();
          final titleSize =
              (screenWidth * 0.078).clamp(26.0, 32.0).toDouble();
          final buttonHeight =
              (screenHeight * 0.065).clamp(52.0, 58.0).toDouble();

          return Column(
            children: [
              const _BackButton(),

              SizedBox(height: screenHeight * 0.025),

              SvgPicture.asset('zentro_pin.svg', width: logoPinSize),
              SizedBox(height: screenHeight * 0.01),
              SvgPicture.asset('zentro_tekst.svg', width: logoTextSize),

              SizedBox(height: screenHeight * 0.035),

              Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: SignupScreen.zentroBlue,
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              const _ZentroTextField(
                icon: Icons.person_outline,
                hint: 'First Name',
              ),

              SizedBox(height: screenHeight * 0.018),

              const _ZentroTextField(
                icon: Icons.person_outline,
                hint: 'Last Name',
              ),

              SizedBox(height: screenHeight * 0.018),

              const _ZentroTextField(
                icon: Icons.email_outlined,
                hint: 'Email Address',
              ),

              SizedBox(height: screenHeight * 0.018),

              const _ZentroTextField(
                icon: Icons.lock_outline,
                hint: 'Password',
                obscureText: true,
              ),

              SizedBox(height: screenHeight * 0.018),

              const _ZentroTextField(
                icon: Icons.lock_outline,
                hint: 'Confirm Password',
                obscureText: true,
              ),

              SizedBox(height: screenHeight * 0.018),

              const _ZentroTextField(
                icon: Icons.cake_outlined,
                hint: 'Date of Birth',
              ),

              SizedBox(height: screenHeight * 0.018),

              _CheckRow(
                value: acceptedTerms,
                text: 'I accept the Terms & Conditions',
                onChanged: (value) {
                  setState(() {
                    acceptedTerms = value ?? false;
                  });
                },
              ),

              _CheckRow(
                value: acceptedPrivacy,
                text: 'I accept the Privacy Policy',
                onChanged: (value) {
                  setState(() {
                    acceptedPrivacy = value ?? false;
                  });
                },
              ),

              SizedBox(height: screenHeight * 0.025),

              _ZentroButton(
                text: 'Create Account',
                height: buttonHeight,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CreateProfileScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.025),
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
                        child: childBuilder(
                          context,
                          screenWidth,
                          screenHeight,
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
  const _BackButton();

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
          color: SignupScreen.zentroBlue,
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

class _CheckRow extends StatelessWidget {
  final bool value;
  final String text;
  final ValueChanged<bool?> onChanged;

  const _CheckRow({
    required this.value,
    required this.text,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      dense: true,
      contentPadding: EdgeInsets.zero,
      activeColor: SignupScreen.zentroBlue,
      checkColor: Colors.black,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
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