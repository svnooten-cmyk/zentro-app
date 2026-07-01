Mooi. We gaan deze goed doen.

In plaats van een tijdelijke Material-pin maken we nu een eigen Zentro-pin voor de huidige locatie. Later vervangen we alleen de AssetImage door een Firebase-afbeelding.

Maak dit bestand:

lib/widgets/map/current_location_pin.dart

Vervang de inhoud volledig door:

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentLocationPin extends StatelessWidget {
  const CurrentLocationPin({
    super.key,
    this.imageProvider,
  });

  final ImageProvider? imageProvider;

  static const String _pinAsset =
      'assets/pins/base_pin_outline.svg';

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.50 - 34,
      top: MediaQuery.of(context).size.height * 0.42,
      child: SizedBox(
        width: 72,
        height: 86,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 6,
              child: Container(
                width: 26,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),

            SvgPicture.asset(
              _pinAsset,
              width: 72,
              height: 72,
            ),

            Positioned(
              top: 15,
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: imageProvider != null
                      ? Image(
                          image: imageProvider!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/profile_placeholder.png',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}