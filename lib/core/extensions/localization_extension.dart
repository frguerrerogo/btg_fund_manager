import 'package:btg_funds/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// Extension for easy access to localized strings via [BuildContext].
extension LocalizationExtension on BuildContext {
  /// Returns the current [AppLocalizations] instance from the context.
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
