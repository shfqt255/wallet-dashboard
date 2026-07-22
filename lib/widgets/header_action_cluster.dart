import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// Describes one icon inside a [HeaderActionCluster].
class ClusterAction {
  final IconData icon;
  final VoidCallback? onTap;
  final bool showBadge;

  const ClusterAction({
    required this.icon,
    this.onTap,
    this.showBadge = false,
  });
}

/// A single stadium-shaped "card" that groups multiple icon actions
/// together (used for notification + settings in the header). Keeping
/// this generic lets it be reused anywhere a cluster of icon buttons
/// needs to sit inside one shared background.
class HeaderActionCluster extends StatelessWidget {
  final List<ClusterAction> actions;

  const HeaderActionCluster({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.iconChipBackground,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final action in actions)
            Stack(
              clipBehavior: Clip.none,
              children: [
                Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    onTap: action.onTap,
                    customBorder: const CircleBorder(),
                    child: SizedBox(
                      width: 45,
                      height: 30,
                      child: Icon(
                        action.icon,
                        size: 22,
                        color: AppColors.iconcolor,
                      ),
                    ),
                  ),
                ),
                if (action.showBadge)
                  Positioned(
                    top: 4,
                    right: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.notificationRed,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
