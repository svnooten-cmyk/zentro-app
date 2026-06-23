import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapSection extends StatefulWidget {
  const MapSection({super.key});

  @override
  State<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends State<MapSection> {
  final MapController mapController = MapController();

  String selectedMainTab = 'Family';
  String selectedContentTab = 'Journey';

  static const Color zentroBlue = Color(0xFF00D4FF);

  final LatLng currentLocation = const LatLng(-8.4095, 115.1889);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2E),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.10),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _mainTabs(),
              AspectRatio(
                aspectRatio: 1.45,
                child: Stack(
                  children: [
                    FlutterMap(
                      mapController: mapController,
                      options: const MapOptions(
                        initialCenter: LatLng(5, 110),
                        initialZoom: 3.4,
                        minZoom: 2,
                        maxZoom: 15,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'zentro_app',
                        ),
                        if (selectedContentTab == 'Journey')
                          PolylineLayer(
                            polylines: [
                              Polyline(
                                points: const [
                                  LatLng(52.3676, 4.9041),
                                  LatLng(35.6762, 139.6503),
                                  LatLng(-8.4095, 115.1889),
                                  LatLng(-8.6500, 116.3249),
                                ],
                                color: zentroBlue,
                                strokeWidth: 4,
                              ),
                            ],
                          ),
                        MarkerLayer(
                          markers: [
                            _pinMarker(
                              point: const LatLng(52.3676, 4.9041),
                              color: Colors.purpleAccent,
                              icon: Icons.flight_takeoff,
                              title: 'Amsterdam',
                            ),
                            _pinMarker(
                              point: const LatLng(35.6762, 139.6503),
                              color: Colors.greenAccent,
                              icon: Icons.auto_stories,
                              title: 'Tokyo',
                            ),
                            _pinMarker(
                              point: const LatLng(-8.4095, 115.1889),
                              color: Colors.orangeAccent,
                              icon: Icons.location_on,
                              title: 'Bali',
                            ),
                            _pinMarker(
                              point: const LatLng(-8.6500, 116.3249),
                              color: Colors.lightBlueAccent,
                              icon: Icons.videocam,
                              title: 'Lombok',
                            ),
                          ],
                        ),
                      ],
                    ),

                    Positioned(
                      right: 12,
                      top: 12,
                      child: Column(
                        children: [
                          _MapActionButton(
                            icon: Icons.my_location,
                            onTap: () {
                              mapController.move(currentLocation, 7);
                            },
                          ),
                          const SizedBox(height: 10),
                          _MapActionButton(
                            icon: Icons.add_location_alt,
                            onTap: () {
                              _showMessage(
                                context,
                                'Nieuwe pin toevoegen',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _contentTabs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainTabs() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
      child: Row(
        children: [
          _mainTab('Family', Icons.family_restroom),
          const SizedBox(width: 8),
          _mainTab('Discovery', Icons.travel_explore),
          const SizedBox(width: 8),
          _mainTab('Knowledge', Icons.school_outlined),
        ],
      ),
    );
  }

  Widget _mainTab(String label, IconData icon) {
    final isSelected = selectedMainTab == label;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedMainTab = label;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? zentroBlue.withValues(alpha: 0.18)
                : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? zentroBlue
                  : Colors.white.withValues(alpha: 0.10),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? zentroBlue : Colors.white70,
                size: 18,
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontSize: 12.5,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.24),
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.08),
          ),
        ),
      ),
      child: Row(
        children: [
          _contentTab('Journey', Icons.flag, Colors.deepPurpleAccent),
          _contentTab('Stories', Icons.auto_stories, Colors.purpleAccent),
          _contentTab('Vlogs', Icons.video_library, Colors.greenAccent),
          _contentTab('Photos', Icons.photo_camera, Colors.orangeAccent),
        ],
      ),
    );
  }

  Widget _contentTab(String label, IconData icon, Color color) {
    final isSelected = selectedContentTab == label;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedContentTab = label;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 17,
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              height: 3,
              width: isSelected ? 42 : 0,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Marker _pinMarker({
    required LatLng point,
    required Color color,
    required IconData icon,
    required String title,
  }) {
    return Marker(
      point: point,
      width: 48,
      height: 48,
      child: GestureDetector(
        onTap: () {
          _showMessage(context, '$title geopend');
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.location_pin,
              color: color,
              size: 44,
            ),
            Positioned(
              top: 9,
              child: Icon(
                icon,
                color: Colors.white,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class _MapActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _MapActionButton({
    required this.icon,
    required this.onTap,
  });

  static const Color zentroBlue = Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1B2E).withValues(alpha: 0.92),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.20),
            ),
          ),
          child: Icon(
            icon,
            color: zentroBlue,
            size: 23,
          ),
        ),
      ),
    );
  }
}