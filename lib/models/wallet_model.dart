import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// Visual theme applied to a [WalletModel] card.
enum WalletTheme { brown, navy }

extension WalletThemeGradient on WalletTheme {
  List<Color> get gradientColors {
    switch (this) {
      case WalletTheme.brown:
        return const [AppColors.walletBrownStart, AppColors.walletBrownEnd];
      case WalletTheme.navy:
        return const [AppColors.walletNavyStart, AppColors.walletNavyEnd];
    }
  }
}

/// A shared/joint wallet (e.g. "Family Budget", "Birthday Mike").
class WalletModel {
  final String id;
  final String name;
  final double balance;
  final List<Color> memberColors;
  final List<String?> memberImagePaths;
  final WalletTheme theme;

  const WalletModel({
    required this.id,
    required this.name,
    required this.balance,
    required this.memberColors,
    this.memberImagePaths = const [],
    required this.theme,
  });
}
