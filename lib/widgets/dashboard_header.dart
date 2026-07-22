import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../providers/dashboard_provider.dart';
import 'header_action_cluster.dart';

/// Top greeting row: avatar + "Hello! <name>" plus a single grouped
/// notification/settings action cluster on the trailing side.
class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();
    final user = provider.user;

    return Row(
      children: [
        const CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.navy,
            backgroundImage: AssetImage("assets/images/users/user1.jpg")),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hello!', style: AppTextStyles.greeting),
            Text(user.name, style: AppTextStyles.userName),
          ],
        ),
        const Spacer(),
        HeaderActionCluster(
          actions: [
            ClusterAction(
              icon: Icons.notifications_none_rounded,
              showBadge: user.hasUnreadNotification,
              onTap: () {},
            ),
            ClusterAction(icon: Icons.settings_outlined, onTap: () {}),
          ],
        ),
      ],
    );
  }
}
