import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Proveedor que mantiene el índice de navegación actual (ej. para un BottomNavigationBar o Sidebar).
final navigationIndexProvider = StateProvider<int>((ref) => 0);

/// Proveedor que indica si el sidebar está expandido o colapsado.
final isSidebarExpandedProvider = StateProvider<bool>((ref) => false);
