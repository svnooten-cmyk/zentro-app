  import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen_family.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String selectedProfileType = 'Solo';

  String get profileNameHint {
    if (selectedProfileType == 'Couple') return 'Couple Name';
    if (selectedProfileType == 'Group') return 'Group Name';
    if (selectedProfileType == 'Family') return 'Family Name';
    return 'Profile Name';
  }

  IconData get profileNameIcon {
    if (selectedProfileType == 'Couple') return Icons.favorite_border;
    if (selectedProfileType == 'Group') return Icons.groups_outlined;
    if (selectedProfileType == 'Family') return Icons.family_restroom;
    return Icons.person_outline;
  }

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

              const Spacer(),

              SvgPicture.asset('zentro_pin.svg', width: logoPinSize),
              SizedBox(height: screenHeight * 0.01),
              SvgPicture.asset('zentro_tekst.svg', width: logoTextSize),

              SizedBox(height: screenHeight * 0.035),

              Text(
                'Create Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CreateProfileScreen.zentroBlue,
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.012),

              const Text(
                'Choose profile type',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Members can be added later',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),

              SizedBox(height: screenHeight * 0.035),

              Row(
                children: [
                  Expanded(
                    child: _ProfileTypeButton(
                      label: 'Solo',
                      icon: Icons.person_outline,
                      value: 'Solo',
                      selectedValue: selectedProfileType,
                      onTap: _selectProfileType,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _ProfileTypeButton(
                      label: 'Couple',
                      icon: Icons.favorite_border,
                      value: 'Couple',
                      selectedValue: selectedProfileType,
                      onTap: _selectProfileType,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _ProfileTypeButton(
                      label: 'Group',
                      icon: Icons.groups_outlined,
                      value: 'Group',
                      selectedValue: selectedProfileType,
                      onTap: _selectProfileType,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _ProfileTypeButton(
                      label: 'Family',
                      icon: Icons.family_restroom,
                      value: 'Family',
                      selectedValue: selectedProfileType,
                      onTap: _selectProfileType,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              _ZentroTextField(
                icon: profileNameIcon,
                hint: profileNameHint,
              ),

              SizedBox(height: screenHeight * 0.035),

              _ZentroButton(
                text: 'Continue',
                height: buttonHeight,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreenFamily(),
                    ),
                  );
                },
              ),

              const Spacer(),
            ],
          );
        },
      ),
    );
  }

  void _selectProfileType(String type) {
    setState(() {
      selectedProfileType = type;
    });
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

class _ProfileTypeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;
  final String selectedValue;
  final ValueChanged<String> onTap;

  const _ProfileTypeButton({
    required this.label,
    required this.icon,
    required this.value,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedValue == value;

    return GestureDetector(
      onTap: () => onTap(value),
      child: AspectRatio(
        aspectRatio: 1.65,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white24 : Colors.white12,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected
                  ? CreateProfileScreen.zentroBlue
                  : Colors.white.withValues(alpha: 0.16),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: CreateProfileScreen.zentroBlue,
                size: 28,
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white70,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZentroTextField extends StatelessWidget {
  final IconData icon;
  final String hint;

  const _ZentroTextField({
    required this.icon,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: CreateProfileScreen.zentroBlue,
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