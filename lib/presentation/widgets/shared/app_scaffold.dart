import 'package:btg_fund_manager/core/core.dart'
    show AppTextStyles, HomeRoute, TransactionsRoute, SettingsRoute;
import 'package:btg_fund_manager/core/extensions/responsive_context.dart';
import 'package:btg_fund_manager/domain/core/entities.dart' show NavItem;
import 'package:btg_fund_manager/presentation/core/providers.dart' show navigationIndexProvider;
import 'package:btg_fund_manager/presentation/core/providers/navigation_provider.dart'
    show isSidebarExpandedProvider;
import 'package:btg_fund_manager/presentation/widgets/shared/bottom_nav_bar.dart';
import 'package:btg_fund_manager/presentation/widgets/shared/sidebar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppScaffold extends ConsumerWidget {
  AppScaffold({super.key, required this.body, required this.title, this.showBackButton = false});
  final Widget body;
  final String title;
  final bool showBackButton;

  final List<NavItem> items = [
    NavItem(
      icon: Icons.home,
      label: 'Inicio',
      navigate: (context) => const HomeRoute().go(context),
    ),
    NavItem(
      icon: Icons.history,
      label: 'Transacciones',
      navigate: (context) => const TransactionsRoute().go(context),
    ),
    NavItem(
      icon: Icons.settings,
      label: 'Configuración',
      navigate: (context) => const SettingsRoute().go(context),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = context.isMobile;

    final selectedIndex = ref.watch(navigationIndexProvider);
    final isExpanded = ref.watch(isSidebarExpandedProvider);
    final indexNotifier = ref.read(navigationIndexProvider.notifier);

    void onSelect(int index) {
      indexNotifier.state = index;
      items[index].navigate(context);
    }

    return Scaffold(
      body: isMobile
          ? Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      title,
                      style: AppTextStyles.titleLarge(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(child: body),
                ],
              ),
            )
          : Row(
              children: [
                SidebarMenu(
                  selectedIndex: selectedIndex,
                  isExpanded: isExpanded,
                  onSelect: onSelect,
                  items: items,
                  onToggle: () => ref.read(isSidebarExpandedProvider.notifier).state = !isExpanded,
                ),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: context.responsiveMaxWidth),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Text(title, style: AppTextStyles.titleLarge(context)),
                            const SizedBox(height: 16),
                            Expanded(child: body),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: isMobile
          ? CustomBottomNavBar(selectedIndex: selectedIndex, onSelect: onSelect, items: items)
          : null,
    );
  }
}
