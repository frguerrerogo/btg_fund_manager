/// Standard durations for animations and transitions.
///
/// Maintains consistency in the perceived speed of the app.
/// Use these durations for all animations to ensure a cohesive feel.
abstract class AppDurations {
  AppDurations._();

  //* DURATIONS
  /// Micro-interactions (hover, focus) - 80ms
  static const Duration instant = Duration(milliseconds: 80);

  /// Immediate feedback (ripple, tap) - 150ms
  static const Duration fast = Duration(milliseconds: 150);

  /// State transitions (toggle, expand) - 250ms
  static const Duration normal = Duration(milliseconds: 250);

  /// Element appearance (fade in, slide in) - 350ms
  static const Duration slow = Duration(milliseconds: 350);

  /// Page transitions - 400ms
  static const Duration page = Duration(milliseconds: 400);

  /// Complex animations (loading, skeleton) - 600ms
  static const Duration elaborate = Duration(milliseconds: 600);
}
