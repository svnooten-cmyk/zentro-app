import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    this.coverImage = 'assets/Background.jpg',
    this.profileImage = 'assets/Background.jpg',
    this.name = 'The Van Nooten Family',
    this.country = 'Netherlands',
    this.countryFlag = '🇳🇱',
    this.slogan = 'Travelling the world, making memories together',
    this.friendsCount = '56',
    this.followersCount = '124',
    this.onEditCover,
    this.onEditProfilePhoto,
    this.onAddProfilePhoto,
    this.onEditName,
    this.onEditCountry,
    this.onEditSlogan,
    this.onOpenFriends,
    this.onOpenFollowers,
  });

  static const Color zentroBlue = Color(0xFF00D4FF);

  final String coverImage;
  final String profileImage;
  final String name;
  final String country;
  final String countryFlag;
  final String slogan;
  final String friendsCount;
  final String followersCount;

  final VoidCallback? onEditCover;
  final VoidCallback? onEditProfilePhoto;
  final VoidCallback? onAddProfilePhoto;
  final VoidCallback? onEditName;
  final VoidCallback? onEditCountry;
  final VoidCallback? onEditSlogan;
  final VoidCallback? onOpenFriends;
  final VoidCallback? onOpenFollowers;

  void _fallback(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth;
          final avatarSize = (cardWidth * 0.22).clamp(74.0, 94.0);
          final coverRatio = cardWidth < 370 ? 3.05 : 3.25;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AspectRatio(
                    aspectRatio: coverRatio,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          InkWell(
                            onTap: onEditCover ??
                                () => _fallback(context, 'Cover wijzigen'),
                            child: Image.asset(
                              coverImage,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                          IgnorePointer(
                            child: Container(
                              color: Colors.black.withOpacity(0.22),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: _Clickable(
                      onTap: onEditCover ??
                          () => _fallback(context, 'Edit Cover geklikt'),
                      child: const _EditCoverButton(),
                    ),
                  ),

                  Positioned(
                    left: 16,
                    bottom: -(avatarSize * 0.26),
                    child: _ProfilePhoto(
                      avatarSize: avatarSize,
                      image: profileImage,
                      onPhotoTap: onEditProfilePhoto ??
                          () => _fallback(context, 'Profielfoto wijzigen'),
                      onPlusTap: onAddProfilePhoto ??
                          () => _fallback(context, 'Foto toevoegen'),
                    ),
                  ),

                  Positioned(
                    left: avatarSize + 30,
                    right: 12,
                    bottom: 12,
                    child: _HeaderTextBlock(
                      name: name,
                      country: country,
                      countryFlag: countryFlag,
                      slogan: slogan,
                      onNameTap: onEditName ??
                          () => _fallback(context, 'Naam wijzigen'),
                      onCountryTap: onEditCountry ??
                          () => _fallback(context, 'Land wijzigen'),
                      onSloganTap: onEditSlogan ??
                          () => _fallback(context, 'Slogan wijzigen'),
                    ),
                  ),
                ],
              ),

              SizedBox(height: avatarSize * 0.34),

              Row(
                children: [
                  Expanded(
                    child: _Clickable(
                      onTap: onOpenFriends ??
                          () => _fallback(context, 'Friends openen'),
                      child: _StatCard(
                        icon: Icons.groups_outlined,
                        iconColor: Colors.greenAccent,
                        label: 'Friends',
                        value: friendsCount,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _Clickable(
                      onTap: onOpenFollowers ??
                          () => _fallback(context, 'Followers openen'),
                      child: _StatCard(
                        icon: Icons.group_add_outlined,
                        iconColor: Colors.orangeAccent,
                        label: 'Followers',
                        value: followersCount,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeaderTextBlock extends StatelessWidget {
  const _HeaderTextBlock({
    required this.name,
    required this.country,
    required this.countryFlag,
    required this.slogan,
    required this.onNameTap,
    required this.onCountryTap,
    required this.onSloganTap,
  });

  final String name;
  final String country;
  final String countryFlag;
  final String slogan;

  final VoidCallback onNameTap;
  final VoidCallback onCountryTap;
  final VoidCallback onSloganTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _EditableLine(
          text: name,
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          onTap: onNameTap,
        ),
        const SizedBox(height: 4),
        _EditableLine(
          text: country,
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
          color: ProfileHeader.zentroBlue,
          flag: countryFlag,
          onTap: onCountryTap,
        ),
        const SizedBox(height: 4),
        _EditableLine(
          text: slogan,
          fontSize: 12.5,
          fontWeight: FontWeight.normal,
          color: Colors.white70,
          italic: true,
          onTap: onSloganTap,
        ),
      ],
    );
  }
}

class _EditableLine extends StatelessWidget {
  const _EditableLine({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.onTap,
    this.italic = false,
    this.flag,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final bool italic;
  final String? flag;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _Clickable(
      onTap: onTap,
      borderRadius: 8,
      child: Row(
        children: [
          if (flag != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.16),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: ProfileHeader.zentroBlue.withOpacity(0.55),
                ),
              ),
              child: Text(
                flag!,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(width: 5),
          ],
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                height: 1.08,
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.edit_outlined,
            color: ProfileHeader.zentroBlue,
            size: 15,
          ),
        ],
      ),
    );
  }
}

class _ProfilePhoto extends StatelessWidget {
  const _ProfilePhoto({
    required this.avatarSize,
    required this.image,
    required this.onPhotoTap,
    required this.onPlusTap,
  });

  final double avatarSize;
  final String image;
  final VoidCallback onPhotoTap;
  final VoidCallback onPlusTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _Clickable(
          onTap: onPhotoTap,
          borderRadius: avatarSize / 2,
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          right: -2,
          top: -2,
          child: _Clickable(
            onTap: onPlusTap,
            borderRadius: avatarSize,
            child: Container(
              width: avatarSize * 0.34,
              height: avatarSize * 0.34,
              decoration: const BoxDecoration(
                color: ProfileHeader.zentroBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: avatarSize * 0.22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EditCoverButton extends StatelessWidget {
  const _EditCoverButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(11),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 14,
          ),
          SizedBox(width: 5),
          Text(
            'Edit Cover',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withOpacity(0.10),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 19,
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 3),
          const Icon(
            Icons.chevron_right,
            color: Colors.white70,
            size: 18,
          ),
        ],
      ),
    );
  }
}

class _Clickable extends StatelessWidget {
  const _Clickable({
    required this.child,
    required this.onTap,
    this.borderRadius = 12,
  });

  final Widget child;
  final VoidCallback onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: child,
      ),
    );
  }
}