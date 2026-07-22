import 'package:flutter/material.dart';

/// One colored segment inside the "Transaction" summary bar.
/// [weight] controls the relative width of the segment (flex factor).
class TransactionCategoryModel {
  final Color color;
  final double weight;

  const TransactionCategoryModel({
    required this.color,
    required this.weight,
  });
}
