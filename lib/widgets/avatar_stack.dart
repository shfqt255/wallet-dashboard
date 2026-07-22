import 'package:flutter/material.dart';

/// Renders a row of overlapping circular avatars (member indicators).
///
/// Each entry can be a real photo ([imagePaths]) or fall back to a solid
/// color circle — pass `null` at an index in [imagePaths] (or omit the
/// list entirely) to use [colors] for that member instead.
class AvatarStack extends StatelessWidget {
  final List<Color> colors;
  final List<String?>? imagePaths;
  final double diameter;
  final double overlap;
  final Color borderColor;

  const AvatarStack({
    super.key,
    required this.colors,
    this.imagePaths,
    this.diameter = 26,
    this.overlap = 14,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final width = diameter + (colors.length - 1) * overlap;
    return SizedBox(
      width: width,
      height: diameter,
      child: Stack(
        children: [
          for (var i = 0; i < colors.length; i++)
            Positioned(
              left: i * overlap,
              child: _AvatarCircle(
                color: colors[i],
                imagePath: (imagePaths != null && i < imagePaths!.length)
                    ? imagePaths![i]
                    : null,
                diameter: diameter,
                borderColor: borderColor,
              ),
            ),
        ],
      ),
    );
  }
}

class _AvatarCircle extends StatelessWidget {
  final Color color;
  final String? imagePath;
  final double diameter;
  final Color borderColor;

  const _AvatarCircle({
    required this.color,
    required this.imagePath,
    required this.diameter,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: imagePath == null
          ? null
          : ClipOval(
              child: Image.asset(
                imagePath!,
                fit: BoxFit.cover,
                // Keeps the solid color circle as a silent fallback if
                // the photo asset hasn't been added yet.
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ),
    );
  }
}
