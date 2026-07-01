import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasePin extends StatefulWidget {
  const BasePin({
    super.key,
    required this.iconAsset,
    this.size = 72,
    this.onTap,
  });

  final String iconAsset;
  final double size;
  final VoidCallback? onTap;

  @override
  State<BasePin> createState() => _BasePinState();
}

class _BasePinState extends State<BasePin> {
  bool _hovering = false;
  bool _pressed = false;

  static const String _pinAsset = 'assets/pins/base_pin_outline.svg';

  @override
  Widget build(BuildContext context) {
    final pinWidth = widget.size * 0.80;
    final pinHeight = widget.size * 0.80;

    final scale = _pressed ? 0.92 : (_hovering ? 1.08 : 1.0);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) {
          setState(() => _pressed = false);
          widget.onTap?.call();
        },
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
          scale: scale,
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: widget.size * 0.04,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 180),
                    opacity: _hovering ? 0.55 : 0.35,
                    child: Container(
                      width: widget.size * 0.46,
                      height: widget.size * 0.14,
                      decoration: BoxDecoration(
                        color: const Color(0xFF22D3EE),
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF22D3EE).withOpacity(
                              _hovering ? 0.80 : 0.55,
                            ),
                            blurRadius: _hovering ? 26 : 18,
                            spreadRadius: _hovering ? 5 : 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SvgPicture.asset(
                  _pinAsset,
                  width: pinWidth,
                  height: pinHeight,
                  fit: BoxFit.contain,
                ),

                Positioned(
                  top: widget.size * 0.17,
                  left: widget.size * 0.27,
                  child: Container(
                    width: widget.size * 0.16,
                    height: widget.size * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.28),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),

                Positioned(
                  top: widget.size * 0.20,
                  child: SizedBox(
                    width: widget.size * 0.45,
                    height: widget.size * 0.45,
                    child: SvgPicture.asset(
                      widget.iconAsset,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}