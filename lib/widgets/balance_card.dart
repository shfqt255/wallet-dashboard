import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_dashboard/core/assets.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../providers/dashboard_provider.dart';
import 'brand_mark.dart';
import 'circle_icon_button.dart';
import 'painters/checkerboard_painter.dart';

/// The primary card showing card brand, total balance and the
/// show/hide-balance affordance.
class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CardBrandStrip(cardBrandLast4: provider.cardBrandLast4),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total balance',
                          style: AppTextStyles.cardLabel),
                      const SizedBox(height: 4),
                      Text(
                        provider.isBalanceVisible
                            ? _formatCurrency(provider.totalBalance)
                            : '••••••',
                        style: AppTextStyles.balanceAmount,
                      ),
                    ],
                  ),
                ),
                CircleIconButton(
                  icon: provider.isBalanceVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  onTap: provider.toggleBalanceVisibility,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(double amount) {
    final wholeAndCents = amount.toStringAsFixed(2).split('.');
    final whole = wholeAndCents[0];
    final buffer = StringBuffer();
    for (var i = 0; i < whole.length; i++) {
      final fromEnd = whole.length - i;
      buffer.write(whole[i]);
      if (fromEnd > 1 && fromEnd % 3 == 1) buffer.write(',');
    }
    return '\$$buffer.${wholeAndCents[1]}';
  }
}

/// The card-brand strip at the top of the balance card: a full-width
/// checkerboard watermark with the brand mark and VISA/card-number pair
/// overlaid, clipped to the card's own top corners.
class _CardBrandStrip extends StatelessWidget {
  final String cardBrandLast4;

  const _CardBrandStrip({required this.cardBrandLast4});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(26),
        topRight: Radius.circular(26),
      ),
      child: Container(
        height: 88,
        color: AppColors.balanceCardStrip,
        child: Stack(
          children: [
            const Positioned.fill(
              child: CustomPaint(
                  painter: CheckerboardPainter(color: AppColors.navy)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandMark(),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        AppAssets.visa,
                        width: 60,
                        height: 20,
                      ),
                      Text(
                        cardBrandLast4,
                        style: AppTextStyles.cardNumber,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
