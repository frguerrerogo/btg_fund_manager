import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:btg_fund_manager/domain/entities/entities.dart' show NavItem;
import 'package:btg_fund_manager/presentation/widgets/shared/bottom_nav_bar.dart';
import 'package:btg_fund_manager/presentation/widgets/shared/sidebar_menu.dart';
import 'package:flutter/material.dart';
import 'package:btg_fund_manager/core/extensions/responsive_context.dart';

class AppScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final bool showBackButton;

  const AppScaffold({
    super.key,
    required this.body,
    required this.title,
    this.showBackButton = false,
  });

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _selectedIndex = 0;

  final List<NavItem> _items = const [
    NavItem(icon: Icons.home, label: 'Inicio'),
    NavItem(icon: Icons.history, label: 'Historial'),
    NavItem(icon: Icons.settings, label: 'Configuración'),
  ];

  void _onSelect(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(widget.title, style: AppTextStyles.titleLarge(context)),
              ),
              leading: widget.showBackButton ? const BackButton() : null,
            )
          : null,
      body: isMobile
          ? Padding(padding: const EdgeInsets.only(top: 20.0), child: widget.body)
          : Row(
              children: [
                SidebarMenu(
                  selectedIndex: _selectedIndex,
                  onToggle: () {},
                  onSelect: (index) => setState(() => _selectedIndex = index),
                  items: _items,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Text(widget.title, style: AppTextStyles.titleLarge(context)),
                        const SizedBox(height: 16),
                        Expanded(child: widget.body),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: isMobile
          ? CustomBottomNavBar(selectedIndex: _selectedIndex, onSelect: _onSelect, items: _items)
          : null,
    );
  }
}
