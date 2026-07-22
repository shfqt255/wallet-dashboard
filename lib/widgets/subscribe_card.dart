import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../providers/dashboard_provider.dart';

class SubscribeCard extends StatelessWidget {
  const SubscribeCard({super.key});

  static const double _diameter = 35;
  static const double _overlap = 20;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();
    final subscriptions = provider.subscriptions;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Subscribe', style: AppTextStyles.summaryTitle),
          const SizedBox(height: 14),
          SizedBox(
            height: _diameter,
            child: Stack(
              children: [
                for (var i = 0; i < subscriptions.length; i++)
                  Positioned(
                    left: i * _overlap,
                    child: _ServiceBubble(
                      color: subscriptions[i].color,
                      imagePath: subscriptions[i].imagePath,
                      diameter: _diameter,
                    ),
                  ),
                if (provider.extraSubscriptionsCount > 0)
                  Positioned(
                    left: subscriptions.length * _overlap,
                    child: Container(
                      width: _diameter,
                      height: _diameter,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.iconChipBackground,
                        border: Border.fromBorderSide(
                          BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      child: Text(
                        '+${provider.extraSubscriptionsCount}',
                        style: AppTextStyles.summaryFootnote.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceBubble extends StatelessWidget {
  final Color color;
  final String imagePath;
  final double diameter;

  const _ServiceBubble({
    required this.color,
    required this.imagePath,
    required this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: const Border.fromBorderSide(
          BorderSide(color: Colors.white, width: 2),
        ),
      ),
      child: ClipOval(
        child: Padding(
          padding: EdgeInsets.all(diameter * 0.2),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.apps_rounded,
              size: diameter * 0.5,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
