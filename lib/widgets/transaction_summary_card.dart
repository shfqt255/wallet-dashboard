import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../providers/dashboard_provider.dart';

class TransactionSummaryCard extends StatelessWidget {
  const TransactionSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Transaction', style: AppTextStyles.summaryTitle),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              height: 8,
              child: Row(
                children: [
                  for (final category in provider.transactionCategories)
                    Expanded(
                      flex: (category.weight * 10).round(),
                      child: Container(
                        margin: const EdgeInsets.only(right: 2),
                        color: category.color,
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'In ${provider.monthlySpendLabel}: \$${provider.monthlySpend.toStringAsFixed(0)}',
            style: AppTextStyles.summaryFootnote,
          ),
        ],
      ),
    );
  }
}
