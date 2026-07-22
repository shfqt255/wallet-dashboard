import 'package:flutter/material.dart';

class TicketNotchClipper extends CustomClipper<Path> {
  final double borderRadius;
  final double notchRadius;

  const TicketNotchClipper({
    this.borderRadius = 20,
    this.notchRadius = 8,
  });

  @override
  Path getClip(Size size) {
    final barPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );
    final notchPath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height),
          radius: notchRadius,
        ),
      );
    return Path.combine(PathOperation.difference, barPath, notchPath);
  }

  @override
  bool shouldReclip(covariant TicketNotchClipper oldClipper) =>
      oldClipper.borderRadius != borderRadius ||
      oldClipper.notchRadius != notchRadius;
}
