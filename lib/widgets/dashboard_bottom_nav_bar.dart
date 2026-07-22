import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/dashboard_provider.dart';
import 'nav_bar_item.dart';

/// Fixed, rounded bottom navigation bar. Stays outside the scroll view
/// in [DashboardScreen] so it never scrolls with the page content.
class DashboardBottomNavBar extends StatelessWidget {
  const DashboardBottomNavBar({super.key});

  static const _items = [
    (icon: Icons.home_rounded, label: 'Home'),
    (icon: Icons.account_balance_wallet_outlined, label: 'Pay'),
    (icon: Icons.history_rounded, label: 'History'),
    (icon: Icons.chat_bubble_outline_rounded, label: 'Chat'),
    (icon: Icons.grid_view_rounded, label: 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            for (var i = 0; i < _items.length; i++)
              NavBarItem(
                icon: _items[i].icon,
                label: _items[i].label,
                isSelected: provider.selectedNavIndex == i,
                onTap: () => provider.selectNavIndex(i),
              ),
          ],
        ),
      ),
    );
  }
}
