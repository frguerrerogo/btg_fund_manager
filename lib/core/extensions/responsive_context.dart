import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  static const double _mobileBreakpoint = 600;
  static const double _tabletBreakpoint = 800;
  static const double _desktopBreakpoint = 1200;

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isMobile => screenWidth < _mobileBreakpoint;
  bool get isTablet => screenWidth >= _mobileBreakpoint && screenWidth < _desktopBreakpoint;
  bool get isDesktop => screenWidth >= _desktopBreakpoint;

  double get responsiveMaxWidth {
    if (isMobile) return screenWidth;
    if (isTablet) return 800;
    return 1000;
  }
}
