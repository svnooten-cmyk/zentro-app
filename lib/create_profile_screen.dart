import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String selectedProfileType = 'Solo';

  String get profileNameHint {
    if (selectedProfileType == 'Couple') {
      return 'Couple Name';
    }

    if (selectedProfileType == 'Group') {
      return 'Group Name';
    }

    if (selectedProfileType == 'Family') {
      return 'Family Name';
    }

    return 'Profile Name';
  }

  IconData get profileNameIcon {
    if (selectedProfileType == 'Couple') {
      return Icons.favorite_border;
    }

    if (selectedProfileType == 'Group') {
      return Icons.groups_outlined;
    }

    if (selectedProfileType == 'Family') {
      return Icons.family_restroom;
    }

    return Icons.person_outline;
  }

  void _selectProfileType(String type) {
    setState(() {
      selectedProfileType = type;
    });
  }

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
                        'Create Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF00D4FF),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

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

                      const SizedBox(height: 28),

                      Row(
                        children: [
                          Expanded(
                            child: _profileTypeButton(
                              label: 'Solo',
                              icon: Icons.person_outline,
                              value: 'Solo',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _profileTypeButton(
                              label: 'Couple',
                              icon: Icons.favorite_border,
                              value: 'Couple',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: _profileTypeButton(
                              label: 'Group',
                              icon: Icons.groups_outlined,
                              value: 'Group',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _profileTypeButton(
                              label: 'Family',
                              icon: Icons.family_restroom,
                              value: 'Family',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: _inputDecoration(
                          icon: profileNameIcon,
                          hint: profileNameHint,
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: 280,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Continue',
                            style: TextStyle(fontSize: 20),
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

  Widget _profileTypeButton({
    required String label,
    required IconData icon,
    required String value,
  }) {
    final bool isSelected = selectedProfileType == value;

    return GestureDetector(
      onTap: () {
        _selectProfileType(value);
      },
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white24 : Colors.white12,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF00D4FF)
                : Colors.white.withOpacity(0.15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xFF00D4FF),
              size: 26,
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
    );
  }

  InputDecoration _inputDecoration({
    required IconData icon,
    required String hint,
  }) {
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: const Color(0xFF00D4FF),
      ),
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white70,
      ),
      filled: true,
      fillColor: Colors.white12,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    );
  }
}