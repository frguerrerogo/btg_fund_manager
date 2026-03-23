/// Complete design system for Task Sphere application.
///
/// This barrel file exports all theme-related classes, providing a single entry point
/// for accessing colors, typography, spacing, shadows, border radius, durations, and themes.
///
/// **Usage:**
/// ```dart
/// import 'package:task_sphere/core/theme/theme.dart';
///
/// // Access design tokens
/// Color primary = AppColorScheme.light.primary;
/// EdgeInsets padding = EdgeInsets.all(AppSpacing.lg);
/// BorderRadius radius = AppBorderRadius.card;
/// Duration duration = AppDurations.normal;
/// TextStyle style = AppTextStyles.titleLarge(context);
///
/// // Apply theme to MaterialApp
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
///   themeMode: ThemeMode.system,
/// )
/// ```
library;

// Context extension
export '../extensions/app_theme_extension.dart' show AppThemeExtension;
// Border radius
export 'app_border_radius.dart' show AppBorderRadius;
// Color system
export 'app_colors.dart' show AppColorScheme, AppColors, AppPalette;
// Animations
export 'app_durations.dart' show AppDurations;
// Elevation and depth
export 'app_shadows.dart' show AppShadows;
// Spacing
export 'app_spacing.dart' show AppSpacing;
// Typography
export 'app_text_styles.dart' show AppTextStyles;
// Theme data
export 'app_theme.dart' show AppTheme;
