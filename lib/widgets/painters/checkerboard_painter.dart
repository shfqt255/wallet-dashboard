import 'package:flutter/material.dart';

/// Draws the faint diagonal checkerboard watermark behind the card logo,
/// matching the reference design's balance card artwork.
class CheckerboardPainter extends CustomPainter {
  final Color color;
  final double squareSize;

  const CheckerboardPainter({
    required this.color,
    this.squareSize = 17,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Lowered from 0.16 → 0.06 so the pattern reads as a faint
    // watermark sitting close behind the logo, not a visible grid.
    final paint = Paint()..color = color.withValues(alpha: 0.06);
    final cols = (size.width / squareSize).ceil();
    final rows = (size.height / squareSize).ceil();

    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        final shouldFill = (row + col) % 2 == 0;
        if (!shouldFill) continue;
        canvas.drawRect(
          Rect.fromLTWH(
              col * squareSize, row * squareSize, squareSize, squareSize),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CheckerboardPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.squareSize != squareSize;
}
