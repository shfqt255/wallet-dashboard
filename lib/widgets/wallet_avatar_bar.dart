import 'package:flutter/material.dart';
import 'avatar_stack.dart';
import 'painters/ticket_notch_clipper.dart';

/// The white "ticket stub" bar at the top of a joint wallet card: a
/// rounded white background holding the overlapping avatars, with a
/// small circular notch clipped out of its bottom-center edge so the
/// card's own background shows through — reused by any card that needs
/// this member-avatar treatment.
class WalletAvatarBar extends StatelessWidget {
  final List<Color> memberColors;
  final List<String?> memberImagePaths;

  const WalletAvatarBar({
    super.key,
    required this.memberColors,
    this.memberImagePaths = const [],
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const TicketNotchClipper(borderRadius: 20, notchRadius: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        color: Colors.white,
        child: AvatarStack(
          colors: memberColors,
          imagePaths: memberImagePaths,
          diameter: 30,
          overlap: 18,
        ),
      ),
    );
  }
}
