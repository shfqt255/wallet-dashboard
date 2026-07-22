import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Reusable text styles so typography stays consistent everywhere.
class AppTextStyles {
  AppTextStyles._();

  static const TextStyle greeting = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle userName = TextStyle(
    fontSize: 17,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle cardLabel = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle balanceAmount = TextStyle(
    fontSize: 30,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );

  static const TextStyle visaMark = TextStyle(
    fontSize: 16,
    color: AppColors.navy,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
    letterSpacing: 0.5,
  );

  static const TextStyle cardNumber = TextStyle(
    fontSize: 17,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle actionLabel = TextStyle(
    fontSize: 12,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 17,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle summaryTitle = TextStyle(
    fontSize: 14,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle summaryFootnote = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle walletName = TextStyle(
    fontSize: 15,
    color: AppColors.textOnDark,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle walletBalanceLabel = TextStyle(
    fontSize: 11,
    color: Color(0xB3FFFFFF),
    fontWeight: FontWeight.w500,
  );

  static const TextStyle walletBalanceAmount = TextStyle(
    fontSize: 16,
    color: AppColors.textOnDark,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle navLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );
}
