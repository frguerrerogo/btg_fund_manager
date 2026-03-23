// lib/core/widgets/adaptive_scaffold.dart

import 'package:btg_funds/app/router/router.dart';
import 'package:btg_funds/core/core.dart'
    show AppBorderRadius, AppSpacing, AppThemeExtension, LocalizationExtension;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A responsive scaffold that switches between a navigation rail and a bottom navigation bar.
///
/// Provides the app shell layout and hosts the routed [child] content.
class AdaptiveScaffold extends StatelessWidget {
  /// Creates a [AdaptiveScaffold] with the given [child].
  const AdaptiveScaffold({
    required this.child,
    super.key,
  });

  /// Routed [Widget] displayed in the scaffold body.
  final Widget child;

  List<NavigationDestination> _getDestinations(BuildContext context) {
    return [
      NavigationDestination(
        icon: const Icon(Icons.account_balance_outlined),
        selectedIcon: const Icon(Icons.account_balance),
        label: context.l10n.fundsTabLabel,
      ),
      NavigationDestination(
        icon: const Icon(Icons.receipt_long_outlined),
        selectedIcon: const Icon(Icons.receipt_long),
        label: context.l10n.historyTabLabel,
      ),
    ];
  }

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(RouteConstants.history)) return 1;
    return 0;
  }

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        const FundsRoute().go(context);
      case 1:
        const HistoryRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _selectedIndex(context);
    final destinations = _getDestinations(context);

    if (context.isWide) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              extended: context.isExtended,
              selectedIndex: selectedIndex,
              onDestinationSelected: (i) => _onDestinationSelected(context, i),
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                child: Container(
                  width: AppSpacing.avatarXl,
                  height: AppSpacing.avatarMd,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: AppBorderRadius.brSm,
                  ),
                  child: Center(
                    child: Text(
                      context.l10n.appLogoText,
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: context.colors.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              destinations: List.generate(destinations.length, (index) {
                final d = destinations[index];
                final isSelected = selectedIndex == index;
                return NavigationRailDestination(
                  icon: d.icon,
                  selectedIcon: d.selectedIcon,
                  label: Text(
                    d.label,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: isSelected ? 14 : 12,
                      fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                      color: isSelected ? context.colors.primary : context.colors.onSurfaceVariant,
                    ),
                  ),
                );
              }),
            ),
            const VerticalDivider(width: AppSpacing.dividerThickness),
            Expanded(child: child),
          ],
        ),
      );
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (i) => _onDestinationSelected(context, i),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorColor: context.colors.onPrimary,
        destinations: List.generate(destinations.length, (index) {
          final d = destinations[index];
          return NavigationDestination(
            icon: d.icon,
            selectedIcon: Ink(
              decoration: BoxDecoration(
                color: context.colors.onPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: d.selectedIcon,
              ),
            ),
            label: d.label,
          );
        }),
      ),
    );
  }
}
