import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:btg_fund_manager/domain/entities/entities.dart' show NavItem;
import 'package:flutter/material.dart';

class SidebarMenu extends StatefulWidget {
  final int selectedIndex;
  final bool isExpanded;
  final ValueChanged<int> onSelect;
  final List<NavItem> items;
  final VoidCallback onToggle;

  const SidebarMenu({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
    required this.items,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  bool _isExpanded = false;
  bool _showLabels = false;
  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
    _showLabels = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: _isExpanded ? 200 : 70,
      color: colorScheme.primaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildToggleButton(),
          const SizedBox(height: 15),
          ...List.generate(widget.items.length, (index) {
            final item = widget.items[index];
            final selected = widget.selectedIndex == index;
            return _buildItem(selected, item, colorScheme, index);
          }),
        ],
      ),
    );
  }

  ListTile _buildItem(bool selected, NavItem item, ColorScheme colorScheme, int index) {
    return ListTile(
      minLeadingWidth: 0,
      dense: true,
      selected: selected,
      leading: Icon(item.icon, color: selected ? colorScheme.primary : Colors.grey),
      title: (_isExpanded && _showLabels)
          ? Text(
              item.label,
              style: AppTextStyles.bodySmall(context).copyWith(
                color: selected ? colorScheme.primary : Colors.black,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            )
          : null,
      onTap: () => widget.onSelect(index),
    );
  }

  Widget _buildToggleButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: SizedBox(
        width: 40,
        height: 40,
        child: InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              Future.delayed(const Duration(milliseconds: 400), () {
                setState(() => _showLabels = !_showLabels);
              });
              widget.onToggle();
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _isExpanded ? 8 : 40,
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: _isExpanded ? 1 : 0,
                  child: const Icon(Icons.arrow_back_ios, size: 20),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _isExpanded ? -40 : 8,
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: _isExpanded ? 0 : 1,
                  child: const Icon(Icons.arrow_forward_ios, size: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
