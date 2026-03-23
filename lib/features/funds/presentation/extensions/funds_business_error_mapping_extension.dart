import 'package:btg_funds/features/funds/domain/domain.dart'
    show AlreadySubscribedException, InsufficientBalanceException, NotSubscribedException;
import 'package:btg_funds/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// Maps funds-domain business exceptions to user-facing messages.
extension FundsBusinessErrorMappingExtension on Object? {
  /// Returns a localized, user-friendly message for known funds business errors.
  ///
  /// Returns `null` when the error is not a funds business exception.
  /// Requires [context] to access localized strings.
  String? mapFundsBusinessErrorToMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final error = this;

    if (error is InsufficientBalanceException) {
      return l10n.errorInsufficientBalance;
    }

    if (error is AlreadySubscribedException) {
      return l10n.errorAlreadySubscribed;
    }

    if (error is NotSubscribedException) {
      return l10n.errorNotSubscribed;
    }

    return null;
  }
}
