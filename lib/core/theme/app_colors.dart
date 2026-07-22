import 'package:flutter/material.dart';

/// Single source of truth for every color used across the dashboard.
/// Keeping these centralized makes it trivial to re-theme the app.
class AppColors {
  AppColors._();

  // Backgrounds
  static const Color scaffoldBackground = Color(0xFFF2F4F8);
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color iconChipBackground = Color(0xFFF2F3F7);
  static const Color balanceCardStrip = Color(0xFFF1F3F8);

  // Text
  static const Color textPrimary = Color(0xFF1A1D29);
  static const Color textSecondary = Color(0xFF9DA3B4);
  static const Color textOnDark = Color(0xFFFFFFFF);

  // Brand / accents
  static const Color navy = Color(0xFF1B2A4A);
  static const Color accentBlue = Color(0xFF3D6BFF);
  static const Color notificationRed = Color(0xFFFF4D4D);

  // Transaction segmented bar
  static const Color chartOrange = Color(0xFFFF9152);
  static const Color chartBlue = Color(0xFF4A6CF7);
  static const Color chartGreen = Color(0xFF34C77B);
  static const Color chartPink = Color(0xFFE83E8C);
  static const Color chartPurple = Color(0xFF9B59F6);

  // Subscription chips
  static const Color telegramBlue = Color(0xFF29A9EA);
  static const Color spotifyGreen = Color(0xFF1DB954);
  static const Color chatgptDark = Color(0xFF10A37F);
  static const Color claudeClay = Color(0xFFCC785C);
  static const Color sunOrange = Color(0xFFFF7A45);

  // Joint wallet cards
  static const Color walletBrownStart = Color(0xFF6E4A38);
  static const Color walletBrownEnd = Color(0xFF4A2E22);
  static const Color walletNavyStart = Color(0xFF23304A);
  static const Color walletNavyEnd = Color(0xFF0E1626);

  static const Color divider = Color(0xFFE7E9F0);

  // icons
  static const Color iconcolor = Color(0xFF5F6368);
}
