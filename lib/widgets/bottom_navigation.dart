import 'package:flutter/material.dart';

class ZentroBottomNavigation extends StatelessWidget {
  const ZentroBottomNavigation({super.key});

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 6,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2E),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: Colors.white.withOpacity(0.10),
          ),
        ),
        child: const Row(
          children: [
            _BottomItem(
              icon: Icons.home,
              label: 'Home',
              isActive: true,
            ),
            _BottomItem(
              icon: Icons.assignment_outlined,
              label: 'Requests',
              isActive: false,
            ),
            _BottomItem(
              icon: Icons.chat_bubble_outline,
              label: 'Chat',
              isActive: false,
              badge: '2',
            ),
            _BottomItem(
              icon: Icons.person_outline,
              label: 'Profile',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final String? badge;

  const _BottomItem({
    required this.icon,
    required this.label,
    required this.isActive,
    this.badge,
  });

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    final itemColor = isActive ? zentroBlue : Colors.white60;

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                icon,
                color: itemColor,
                size: 27,
              ),
              if (badge != null)
                Positioned(
                  right: -10,
                  top: -8,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF304F),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      badge!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: itemColor,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

