import 'package:flutter/material.dart';

import '../widgets/profile_header.dart';
import '../widgets/profile_switcher.dart';
import '../widgets/map_section.dart';
import '../widgets/content_section.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreenFamily extends StatelessWidget {
  const HomeScreenFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07111F),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final contentWidth = screenWidth > 430 ? 430.0 : screenWidth;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: contentWidth,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileHeader(),
                      ProfileSwitcher(),
                      MapSection(),
                      ContentSection(),
                      ZentroBottomNavigation(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}