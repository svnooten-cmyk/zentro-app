import 'package:flutter/material.dart';

enum ActiveProfile {
  family,
  sebastiaan,
  partner,
  son,
}

class ProfileSwitcher extends StatefulWidget {
  const ProfileSwitcher({super.key});

  @override
  State<ProfileSwitcher> createState() => _ProfileSwitcherState();
}

class _ProfileSwitcherState extends State<ProfileSwitcher> {
  ActiveProfile activeProfile = ActiveProfile.sebastiaan;

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2E),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: Colors.white.withOpacity(0.10),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Members',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 28),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Add+',
                    style: TextStyle(
                      color: zentroBlue,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: 92,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _MemberCard(
                    name: 'Family',
                    role: 'Profile',
                    icon: Icons.family_restroom,
                    isSelected: activeProfile == ActiveProfile.family,
                    onTap: () {
                      setState(() {
                        activeProfile = ActiveProfile.family;
                      });
                    },
                  ),
                  _MemberCard(
                    name: 'Sebastiaan',
                    role: 'Admin',
                    icon: Icons.person,
                    isSelected: activeProfile == ActiveProfile.sebastiaan,
                    isAdmin: true,
                    onTap: () {
                      setState(() {
                        activeProfile = ActiveProfile.sebastiaan;
                      });
                    },
                  ),
                  _MemberCard(
                    name: 'Partner',
                    role: 'Member',
                    icon: Icons.person_outline,
                    isSelected: activeProfile == ActiveProfile.partner,
                    onTap: () {
                      setState(() {
                        activeProfile = ActiveProfile.partner;
                      });
                    },
                  ),
                  _MemberCard(
                    name: 'Son',
                    role: 'Member',
                    icon: Icons.child_care,
                    isSelected: activeProfile == ActiveProfile.son,
                    onTap: () {
                      setState(() {
                        activeProfile = ActiveProfile.son;
                      });
                    },
                  ),
                  _AddMemberCard(
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemberCard extends StatelessWidget {
  final String name;
  final String role;
  final IconData icon;
  final bool isSelected;
  final bool isAdmin;
  final VoidCallback onTap;

  const _MemberCard({
    required this.name,
    required this.role,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.isAdmin = false,
  });

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 88,
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? zentroBlue.withOpacity(0.10)
              : Colors.white.withOpacity(0.055),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? zentroBlue
                : Colors.white.withOpacity(0.10),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Stack(
          children: [
            if (isAdmin)
              const Positioned(
                left: 6,
                top: 6,
                child: Icon(
                  Icons.workspace_premium,
                  color: Color(0xFFFFB020),
                  size: 17,
                ),
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: zentroBlue.withOpacity(0.16),
                      child: Icon(
                        icon,
                        color: zentroBlue,
                        size: 25,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      role,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: zentroBlue,
                        fontSize: 10.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddMemberCard extends StatelessWidget {
  final VoidCallback onTap;

  const _AddMemberCard({
    required this.onTap,
  });

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 88,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white.withOpacity(0.18),
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(height: 6),
            Text(
              'Add',
              style: TextStyle(
                color: zentroBlue,
                fontSize: 12.5,
              ),
            ),
            Text(
              'Member',
              style: TextStyle(
                color: zentroBlue,
                fontSize: 12.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}