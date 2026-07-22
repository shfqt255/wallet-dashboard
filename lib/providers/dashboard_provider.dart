import 'package:flutter/material.dart';
import 'package:wallet_dashboard/core/assets.dart';
import '../core/theme/app_colors.dart';
import '../models/subscription_model.dart';
import '../models/transaction_category_model.dart';
import '../models/user_model.dart';
import '../models/wallet_model.dart';

/// Holds every piece of state the dashboard screen needs and notifies
/// listeners on change. Screens/widgets stay dumb and simply read from
/// this provider via [Consumer]/[context.watch].
class DashboardProvider extends ChangeNotifier {
  DashboardProvider() {
    _loadMockData();
  }

  // ---- User & balance -----------------------------------------------
  late final UserModel user;
  double totalBalance = 0;
  String cardBrandLast4 = '2050';

  bool _isBalanceVisible = true;
  bool get isBalanceVisible => _isBalanceVisible;

  void toggleBalanceVisibility() {
    _isBalanceVisible = !_isBalanceVisible;
    notifyListeners();
  }

  // ---- Transaction summary --------------------------------------------
  double monthlySpend = 0;
  String monthlySpendLabel = 'May';
  List<TransactionCategoryModel> transactionCategories = [];

  // ---- Subscriptions ----------------------------------------------------
  List<SubscriptionModel> subscriptions = [];
  int extraSubscriptionsCount = 0;

  // ---- Joint wallets ----------------------------------------------------
  List<WalletModel> jointWallets = [];

  // ---- Bottom navigation --------------------------------------------
  int _selectedNavIndex = 0;
  int get selectedNavIndex => _selectedNavIndex;

  void selectNavIndex(int index) {
    if (index == _selectedNavIndex) return;
    _selectedNavIndex = index;
    notifyListeners();
  }

  void _loadMockData() {
    user = const UserModel(name: 'Massimo Osti', hasUnreadNotification: true);
    totalBalance = 40850.10;

    monthlySpend = 2350;
    transactionCategories = const [
      TransactionCategoryModel(color: AppColors.chartOrange, weight: 3),
      TransactionCategoryModel(color: AppColors.chartBlue, weight: 2.4),
      TransactionCategoryModel(color: AppColors.chartGreen, weight: 1.6),
      TransactionCategoryModel(color: AppColors.chartPink, weight: 1),
      TransactionCategoryModel(color: AppColors.chartPurple, weight: 1),
    ];

    subscriptions = const [
      SubscriptionModel(
        name: 'Telegram',
        imagePath: AppAssets.telegram,
        color: AppColors.telegramBlue,
      ),
      SubscriptionModel(
        name: 'Spotify',
        imagePath: AppAssets.spotify,
        color: AppColors.spotifyGreen,
      ),
      SubscriptionModel(
        name: 'ChatGPT',
        imagePath: AppAssets.chatGpt,
        color: AppColors.surfaceWhite,
      ),
      SubscriptionModel(
        name: 'Claude',
        imagePath: AppAssets.claude,
        color: AppColors.claudeClay,
      ),
    ];
    extraSubscriptionsCount = 5;

    jointWallets = const [
      WalletModel(
        id: 'family-budget',
        name: 'Family Budget',
        balance: 35800,
        memberColors: const [
          Color(0xFFB98D6F),
          Color(0xFF6D8B74),
          Color(0xFFD9A441),
          Color(0xFF5679C1),
        ],
        memberImagePaths: const [
          AppAssets.user1,
          AppAssets.user2,
          AppAssets.user3,
          AppAssets.user4
        ],
        theme: WalletTheme.brown,
      ),
      WalletModel(
        id: 'birthday-mike',
        name: 'Birthday Mike',
        balance: 1000,
        memberColors: [
          Color(0xFF7C8FA6),
          Color(0xFF3E4C63),
          Color(0xFFC08A5A),
          Color(0xFF89A9C6),
        ],
        memberImagePaths: const [
          AppAssets.user1,
          AppAssets.user2,
          AppAssets.user3,
          AppAssets.user4
        ],
        theme: WalletTheme.navy,
      ),
    ];
  }
}
