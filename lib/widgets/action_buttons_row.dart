import 'package:flutter/material.dart';
import 'package:wallet_dashboard/core/assets.dart';
import 'action_button.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({super.key});

  static final _actions = [
    (
      iconImage: Image.asset(
        AppAssets.send,
        width: 22,
        height: 22,
      ),
      icon: null,
      label: 'Send',
    ),
    (
      iconImage: Image.asset(
        AppAssets.recieve,
        width: 22,
        height: 22,
      ),
      icon: null,
      label: 'Receive',
    ),
    (
      iconImage: Image.asset(
        AppAssets.scan,
        width: 22,
        height: 22,
      ),
      icon: null,
      label: 'Scan',
    ),
    (
      iconImage: Image.asset(
        AppAssets.swap,
        width: 22,
        height: 22,
      ),
      icon: null,
      label: 'Swap',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final action in _actions) ...[
          Expanded(
            child: ActionButton(
              icon: action.icon,
              iconImage: action.iconImage,
              label: action.label,
            ),
          ),
          if (action != _actions.last) const SizedBox(width: 10),
        ],
      ],
    );
  }
}
