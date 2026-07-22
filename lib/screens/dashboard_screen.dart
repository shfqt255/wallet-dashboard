import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/action_buttons_row.dart';
import '../widgets/balance_card.dart';
import '../widgets/dashboard_bottom_nav_bar.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/joint_wallet_section.dart';
import '../widgets/subscribe_card.dart';
import '../widgets/transaction_summary_card.dart';

/// Wallet dashboard screen. Scrollable content sits above a bottom nav
/// bar that is fixed via [Scaffold.bottomNavigationBar], so it never
/// scrolls with the page and never overlaps the last section thanks to
/// the trailing [SizedBox] spacer in the scroll body.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Cap content width on large/tablet screens while staying
            // fluid down to small phones (360px) with no overflow.
            final maxContentWidth = constraints.maxWidth.clamp(0, 480.0);

            return Center(
              child: SizedBox(
                width: maxContentWidth.toDouble(),
                child: const SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const DashboardHeader(),
                      const SizedBox(height: 22),
                      const BalanceCard(),
                      const SizedBox(height: 18),
                      const ActionButtonsRow(),
                      const SizedBox(height: 18),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: TransactionSummaryCard()),
                          SizedBox(width: 12),
                          Expanded(child: SubscribeCard()),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const JointWalletSection(),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const DashboardBottomNavBar(),
    );
  }
}
