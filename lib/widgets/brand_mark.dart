import 'package:flutter/material.dart';
import 'package:wallet_dashboard/core/assets.dart';

class BrandMark extends StatelessWidget {
  const BrandMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.threeblocks,
      height: 50,
      width: 50,
    );
  }
}
