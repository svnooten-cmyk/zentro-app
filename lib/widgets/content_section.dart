import 'package:flutter/material.dart';

class ContentSection extends StatefulWidget {
  const ContentSection({super.key});

  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  int selectedIndex = 0;

  static const Color zentroBlue = Color(0xFF00D4FF);

  final List<_ContentItem> items = const [
    _ContentItem(
      icon: Icons.flight_takeoff,
      title: 'Amsterdam → Bali',
      subtitle: '12 Mar 2027 • Plane',
      author: 'Family Journey',
      count: '24',
    ),
    _ContentItem(
      icon: Icons.two_wheeler,
      title: 'Bali → Uluwatu',
      subtitle: '18 Mar 2027 • Motorbike',
      author: 'Sebastiaan',
      count: '18',
    ),
    _ContentItem(
      icon: Icons.directions_boat,
      title: 'Lombok → Rote',
      subtitle: '22 Mar 2027 • Ferry',
      author: 'Family Journey',
      count: '31',
    ),
    _ContentItem(
      icon: Icons.restaurant,
      title: 'Family Dinner Night',
      subtitle: '1 day ago • Bali',
      author: 'Partner',
      count: '16',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2E),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text(
                  'Journey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                _FilterButton(
                  icon: Icons.people_outline,
                  label: 'All Journeys',
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _FilterButton(
                  icon: Icons.sort,
                  label: 'Newest',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 6),

            SizedBox(
              height: 214,
              child: Scrollbar(
                thumbVisibility: true,
                radius: const Radius.circular(10),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: _ContentTile(
                        item: item,
                        isSelected: selectedIndex == index,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _FilterButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: zentroBlue,
            size: 14,
          ),
          const SizedBox(width: 3),
          Text(
            label,
            style: const TextStyle(
              color: zentroBlue,
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentTile extends StatelessWidget {
  final _ContentItem item;
  final bool isSelected;

  const _ContentTile({
    required this.item,
    required this.isSelected,
  });

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.fromLTRB(9, 7, 9, 7),
      decoration: BoxDecoration(
        color: isSelected
            ? zentroBlue.withValues(alpha: 0.13)
            : Colors.white.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isSelected
              ? zentroBlue
              : Colors.white.withValues(alpha: 0.08),
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF12304D),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              item.icon,
              color: zentroBlue,
              size: 23,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11.5,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  item.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 10.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 6),

          Text(
            item.count,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 11.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String author;
  final String count;

  const _ContentItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.count,
  });
}