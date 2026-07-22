import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_colors.dart';
import 'providers/dashboard_provider.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const WalletDashboardApp());
}

/// Root widget: wires up [DashboardProvider] and global theming.
class WalletDashboardApp extends StatelessWidget {
  const WalletDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
      child: MaterialApp(
        title: 'Wallet Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentBlue),
          splashFactory: InkRipple.splashFactory,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
