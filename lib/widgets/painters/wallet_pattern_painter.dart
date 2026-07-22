import 'package:flutter/material.dart';

class WalletPatternPainter extends CustomPainter {
  const WalletPatternPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final center = Offset(size.width * 0.85, size.height * 0.15);
    for (var i = 1; i <= 6; i++) {
      canvas.drawCircle(center, i * 22.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant WalletPatternPainter oldDelegate) => false;
}
