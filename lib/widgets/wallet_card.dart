import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../models/wallet_model.dart';
import 'painters/wallet_pattern_painter.dart';
import 'wallet_avatar_bar.dart';

/// A single joint-wallet card (e.g. "Family Budget", "Birthday Mike").
/// Visual theme (brown / navy) comes from [WalletModel.theme], so the
/// same widget renders every wallet regardless of color scheme.
class WalletCard extends StatelessWidget {
  final WalletModel wallet;
  final VoidCallback? onAddTap;
  final double width;

  const WalletCard({
    super.key,
    required this.wallet,
    this.onAddTap,
    this.width = 168,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: wallet.theme.gradientColors,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            // Full-bleed decorative texture, clipped to the card's own
            // rounded corners rather than the inner padded content box.
            Positioned.fill(
              child: CustomPaint(painter: const WalletPatternPainter()),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  WalletAvatarBar(
                    memberColors: wallet.memberColors,
                    memberImagePaths: wallet.memberImagePaths,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    wallet.name,
                    style: AppTextStyles.walletName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  const Text('Balance',
                      style: AppTextStyles.walletBalanceLabel),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\$${_formatWhole(wallet.balance)}',
                          style: AppTextStyles.walletBalanceAmount,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      _AddButton(onTap: onAddTap),
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

  String _formatWhole(double amount) {
    final whole = amount.toStringAsFixed(0);
    final buffer = StringBuffer();
    for (var i = 0; i < whole.length; i++) {
      final fromEnd = whole.length - i;
      buffer.write(whole[i]);
      if (fromEnd > 1 && fromEnd % 3 == 1) buffer.write(' ');
    }
    return buffer.toString();
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _AddButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.16),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: const Padding(
          padding: EdgeInsets.all(6),
          child: Icon(Icons.add, size: 16, color: AppColors.textOnDark),
        ),
      ),
    );
  }
}
