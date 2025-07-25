import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:btg_fund_manager/domain/core/entities.dart' show NavItem;
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
    required this.items,
  });
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final List<NavItem> items;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onSelect,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: AppTextStyles.bodySmall(context).copyWith(fontWeight: FontWeight.bold),
      unselectedLabelStyle: AppTextStyles.bodySmall(context).copyWith(color: Colors.grey),
      iconSize: 22,
      items: items
          .map((item) => BottomNavigationBarItem(icon: Icon(item.icon), label: item.label))
          .toList(),
    );
  }
}
