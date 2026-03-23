// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'BTG Funds';

  @override
  String get appLogoText => 'BTG';

  @override
  String get fundsTabLabel => 'Funds';

  @override
  String get historyTabLabel => 'History';

  @override
  String get fundsPageTitle => 'Available Funds';

  @override
  String get transactionHistoryPageTitle => 'Transaction History';

  @override
  String get emptyFundsList => 'No funds available';

  @override
  String get emptyTransactionsList => 'No transactions yet';

  @override
  String get subscriptionTransactionLabel => 'Subscription';

  @override
  String get cancellationTransactionLabel => 'Cancellation';

  @override
  String get balanceLabel => 'Available Balance';

  @override
  String get subscribedFundsLabel => 'Subscribed Funds';

  @override
  String get minimumAmountLabel => 'Minimum Amount';

  @override
  String get fundCategoryFpv => 'FPV';

  @override
  String get fundCategoryFic => 'CIF';

  @override
  String get notificationMethodLabel => 'Notification Method';

  @override
  String get notificationMethodEmail => 'Email';

  @override
  String get notificationMethodSms => 'SMS';

  @override
  String get subscribeButtonLabel => 'Subscribe';

  @override
  String get cancelButtonLabel => 'Cancel';

  @override
  String get confirmButtonLabel => 'Confirm';

  @override
  String get retryButtonLabel => 'Retry';

  @override
  String get noButtonLabel => 'No';

  @override
  String get yesCancelButtonLabel => 'Yes, cancel';

  @override
  String get confirmSubscriptionTitle => 'Confirm Subscription';

  @override
  String confirmSubscriptionMessage(String fundName) {
    return 'Do you want to subscribe to $fundName?';
  }

  @override
  String get cancelSubscriptionTitle => 'Cancel Subscription';

  @override
  String cancelSubscriptionMessage(String fundName) {
    return 'Are you sure you want to cancel $fundName?';
  }

  @override
  String subscriptionSuccessMessage(String fundName) {
    return 'Subscription to $fundName successful';
  }

  @override
  String cancellationSuccessMessage(String fundName) {
    return 'Cancellation of $fundName successful';
  }

  @override
  String get errorInsufficientBalance => 'Insufficient balance';

  @override
  String get errorAlreadySubscribed =>
      'You are already subscribed to this fund';

  @override
  String get errorNotSubscribed => 'You are not subscribed to this fund';

  @override
  String get errorConnectionIssue => 'Check your internet connection';

  @override
  String get errorServerIssue => 'Server error. Try again later';

  @override
  String get errorGeneric => 'An unexpected error occurred';
}
