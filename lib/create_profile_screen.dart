import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String selectedProfileType = 'Solo';
  final List<Map<String, String>> members = [
    {'name': '', 'role': 'Adult'},
  ];

  bool get isSolo => selectedProfileType == 'Solo';
  bool get isGroupProfile => selectedProfileType == 'Couple' || selectedProfileType == 'Family';

  void _selectProfileType(String type) {
    setState(() {
      selectedProfileType = type;

      if (type == 'Solo') {
        members
          ..clear()
          ..add({'name': '', 'role': 'Adult'});
      }

      if (type == 'Couple') {
        members
          ..clear()
          ..add({'name': '', 'role': 'Adult'})
          ..add({'name': '', 'role': 'Adult'});
      }

      if (type == 'Family') {
        members
          ..clear()
          ..add({'name': '', 'role': 'Parent'})
          ..add({'name': '', 'role': 'Child'});
      }
    });
  }

  void _addMember() {
    setState(() {
      members.add({
        'name': '',
        'role': selectedProfileType == 'Family' ? 'Child' : 'Adult',
      });
    });
  }

  void _removeMember(int index) {
    setState(() {
      if (members.length > 1) {
        members.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String aboutHint = isSolo ? 'About Me' : 'About Us';

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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        SvgPicture.asset(
                          'zentro_pin.svg',
                          width: 95,
                        ),

                        const SizedBox(height: 8),

                        SvgPicture.asset(
                          'zentro_tekst.svg',
                          width: 120,
                        ),

                        const SizedBox(height: 30),

                        const Text(
                          'Create Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF00D4FF),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          'Set up your travel identity',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 30),

                        Row(
                          children: [
                            Expanded(
                              child: _profileTypeButton(
                                label: 'Solo',
                                icon: Icons.person_outline,
                                value: 'Solo',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _profileTypeButton(
                                label: 'Couple',
                                icon: Icons.favorite_border,
                                value: 'Couple',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _profileTypeButton(
                                label: 'Family',
                                icon: Icons.family_restroom,
                                value: 'Family',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 22),

                        _profilePhotoBox(),

                        const SizedBox(height: 18),

                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                            icon: Icons.badge_outlined,
                            hint: isSolo ? 'Profile Name' : 'Group / Family Name',
                          ),
                        ),

                        const SizedBox(height: 18),

                        TextField(
                          maxLines: 4,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                            icon: Icons.edit_note,
                            hint: aboutHint,
                          ),
                        ),

                        const SizedBox(height: 26),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Members',
                            style: TextStyle(
                              color: Color(0xFF00D4FF),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        for (int i = 0; i < members.length; i++) ...[
                          _memberCard(index: i),
                          const SizedBox(height: 14),
                        ],

                        if (!isSolo)
                          OutlinedButton.icon(
                            onPressed: _addMember,
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xFF00D4FF),
                            ),
                            label: const Text(
                              'Add Member',
                              style: TextStyle(
                                color: Color(0xFF00D4FF),
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(280, 50),
                              side: const BorderSide(
                                color: Color(0xFF00D4FF),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
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

                        const SizedBox(height: 30),
                      ],
                    ),
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
      onTap: () => _selectProfileType(value),
      child: Container(
        height: 78,
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

  Widget _profilePhotoBox() {
    return Container(
      width: double.infinity,
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_a_photo_outlined,
            color: Color(0xFF00D4FF),
          ),
          SizedBox(width: 12),
          Text(
            'Add Profile Picture',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _memberCard({required int index}) {
    final bool canRemove = members.length > 1 && !isSolo;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Member ${index + 1}',
                style: const TextStyle(
                  color: Color(0xFF00D4FF),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              if (canRemove)
                IconButton(
                  onPressed: () => _removeMember(index),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white70,
                    size: 20,
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),

          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: _inputDecoration(
              icon: Icons.person_outline,
              hint: 'Member Name',
            ),
          ),

          const SizedBox(height: 12),

          DropdownButtonFormField<String>(
            value: members[index]['role'],
            dropdownColor: const Color(0xFF111827),
            iconEnabledColor: const Color(0xFF00D4FF),
            style: const TextStyle(color: Colors.white),
            decoration: _inputDecoration(
              icon: Icons.group_outlined,
              hint: 'Role',
            ),
            items: const [
              DropdownMenuItem(
                value: 'Adult',
                child: Text('Adult'),
              ),
              DropdownMenuItem(
                value: 'Parent',
                child: Text('Parent'),
              ),
              DropdownMenuItem(
                value: 'Child',
                child: Text('Child'),
              ),
              DropdownMenuItem(
                value: 'Other',
                child: Text('Other'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                members[index]['role'] = value ?? 'Adult';
              });
            },
          ),

          const SizedBox(height: 12),

          TextField(
            maxLines: 3,
            style: const TextStyle(color: Colors.white),
            decoration: _inputDecoration(
              icon: Icons.edit_note,
              hint: 'About Me',
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: _inputDecoration(
              icon: Icons.interests_outlined,
              hint: 'Interests',
            ),
          ),
        ],
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