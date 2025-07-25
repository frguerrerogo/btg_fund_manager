import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:flutter/material.dart';

class CardInfoCustom extends StatelessWidget {
  const CardInfoCustom({super.key, required this.title, required this.category});

  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyMedium(context).copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            category,
            style: AppTextStyles.bodySmall(context).copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
