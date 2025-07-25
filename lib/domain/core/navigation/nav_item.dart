import 'package:flutter/material.dart';

class NavItem {

  const NavItem({required this.icon, required this.label, required this.navigate});
  final IconData icon;
  final String label;
  final void Function(BuildContext context) navigate;
}
