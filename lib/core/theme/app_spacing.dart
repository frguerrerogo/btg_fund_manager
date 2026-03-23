/// Spacing system based on a 4pt scale.
///
/// All margins, paddings, and gaps should come from this class.
/// This ensures consistent spacing across the entire application.
abstract class AppSpacing {
  AppSpacing._();

  //* BASE SCALE
  /// Minimum spacing (0.5x) - 2pt
  static const double xs2 = 2;

  /// Tiny spacing (1x) - 4pt (minimum visible)
  static const double xs = 4;

  /// Small spacing (2x) - 8pt
  static const double sm = 8;

  /// Medium spacing (3x) - 12pt
  static const double md = 12;

  /// Large spacing (4x) - 16pt (content base)
  static const double lg = 16;

  /// Extra large spacing (5x) - 20pt
  static const double xl = 20;

  /// 2x extra large spacing (6x) - 24pt
  static const double xl2 = 24;

  /// 3x extra large spacing (8x) - 32pt
  static const double xl3 = 32;

  /// 4x extra large spacing (10x) - 40pt
  static const double xl4 = 40;

  /// 5x extra large spacing (12x) - 48pt
  static const double xl5 = 48;

  /// 6x extra large spacing (16x) - 64pt
  static const double xl6 = 64;

  /// 7x extra large spacing (20x) - 80pt
  static const double xl7 = 80;

  /// 8x extra large spacing (24x) - 96pt
  static const double xl8 = 96;

  //* SEMANTIC ALIASES
  /// Minimum separation between inline elements (icons, chips)
  static const double inlineGap = sm;

  /// Standard separation between list/column elements
  static const double itemGap = lg;

  /// Internal padding for cards and containers
  static const double cardPadding = xl2;

  /// Horizontal padding for screen edges
  static const double screenHorizontal = xl2;

  /// Vertical padding for screen edges
  static const double screenVertical = xl3;

  /// Separation between screen sections
  static const double sectionGap = xl3;

  /// Horizontal padding for small buttons
  static const double buttonPaddingSmH = lg;

  /// Vertical padding for small buttons
  static const double buttonPaddingSmV = sm;

  /// Horizontal padding for medium buttons
  static const double buttonPaddingMdH = xl2;

  /// Vertical padding for medium buttons
  static const double buttonPaddingMdV = md;

  /// Horizontal padding for large buttons
  static const double buttonPaddingLgH = xl3;

  /// Vertical padding for large buttons
  static const double buttonPaddingLgV = lg;

  //* FIXED DIMENSIONS
  /// Small icon size - 16pt
  static const double iconSm = 16;

  /// Medium icon size - 20pt
  static const double iconMd = 20;

  /// Medium-large icon size - 18pt
  static const double iconMdLg = 18;

  /// Large icon size - 24pt
  static const double iconLg = 24;

  /// Extra large icon size - 32pt
  static const double iconXl = 32;

  /// 2x extra large icon size - 40pt
  static const double iconXl2 = 40;

  /// 3x extra large icon size - 48pt
  static const double iconXl3 = 48;

  /// Small avatar size - 32pt
  static const double avatarSm = 32;

  /// Medium avatar size - 40pt
  static const double avatarMd = 40;

  /// Large avatar size - 56pt
  static const double avatarLg = 56;

  /// Extra large avatar size - 72pt
  static const double avatarXl = 72;

  /// Divider line thickness
  static const double dividerThickness = 1;

  /// Thin border width - 0.5pt
  static const double borderWidthThin = 0.5;

  /// Standard border width - 1.5pt
  static const double borderWidthStandard = 1.5;

  /// Focused border width - 2pt
  static const double borderWidthFocused = 2;

  /// Standard app bar height
  static const double appBarHeight = 56;

  /// Bottom navigation bar height
  static const double bottomNavHeight = 64;

  /// Standard input field height
  static const double inputHeight = 48;

  /// Small button height
  static const double buttonHeightSm = 32;

  /// Medium button height
  static const double buttonHeightMd = 44;

  /// Large button height
  static const double buttonHeightLg = 52;
}
