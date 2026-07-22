import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// A light, circular icon button reused for header, balance card and
/// section-header affordances so every "chip" in the UI stays consistent.
class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final Color background;
  final Color iconColor;
  final Widget? badge;

  const CircleIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.size = 40,
    this.iconSize = 18,
    this.background = AppColors.iconChipBackground,
    this.iconColor = AppColors.textPrimary,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: background,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(icon, size: iconSize, color: iconColor),
            ),
          ),
        ),
        if (badge != null) Positioned(top: -1, right: -1, child: badge!),
      ],
    );
  }
}
