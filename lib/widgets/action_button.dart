import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  final IconData? icon;
  final Widget? iconImage;
  final String label;
  final VoidCallback? onTap;

  const ActionButton({
    super.key,
    this.icon,
    this.iconImage,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceWhite,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconImage ??
                  Icon(
                    icon,
                    size: 25,
                  ),
              const SizedBox(height: 8),
              Text(
                label,
                style: AppTextStyles.actionLabel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
