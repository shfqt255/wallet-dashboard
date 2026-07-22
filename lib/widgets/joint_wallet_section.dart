import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import 'section_header.dart';
import 'wallet_card.dart';

/// "Joint Wallet" section: title + three-dot popup menu, followed by a
/// horizontally scrollable list of [WalletCard]s.
class JointWalletSection extends StatelessWidget {
  const JointWalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wallets = context.watch<DashboardProvider>().jointWallets;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Joint Wallet',
          trailing: _MoreMenuButton(),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: wallets.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) => WalletCard(wallet: wallets[index]),
          ),
        ),
      ],
    );
  }
}

class _MoreMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      child: Container(
        width: 34,
        height: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black45,
            width: 1.5,
          ),
        ),
        child: const Icon(
          Icons.more_horiz,
          size: 18,
          color: Colors.black45,
        ),
      ),
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'add', child: Text('Add new wallet')),
        PopupMenuItem(value: 'manage', child: Text('Manage wallets')),
        PopupMenuItem(value: 'archive', child: Text('Archived wallets')),
      ],
    );
  }
}
