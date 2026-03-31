import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'BTG Fondos'**
  String get appTitle;

  /// No description provided for @appLogoText.
  ///
  /// In es, this message translates to:
  /// **'BTG'**
  String get appLogoText;

  /// No description provided for @fundsTabLabel.
  ///
  /// In es, this message translates to:
  /// **'Fondos'**
  String get fundsTabLabel;

  /// No description provided for @historyTabLabel.
  ///
  /// In es, this message translates to:
  /// **'Historial'**
  String get historyTabLabel;

  /// No description provided for @fundsPageTitle.
  ///
  /// In es, this message translates to:
  /// **'Fondos disponibles'**
  String get fundsPageTitle;

  /// No description provided for @transactionHistoryPageTitle.
  ///
  /// In es, this message translates to:
  /// **'Historial de transacciones'**
  String get transactionHistoryPageTitle;

  /// No description provided for @emptyFundsList.
  ///
  /// In es, this message translates to:
  /// **'No hay fondos disponibles'**
  String get emptyFundsList;

  /// No description provided for @emptyTransactionsList.
  ///
  /// In es, this message translates to:
  /// **'No hay transacciones aún'**
  String get emptyTransactionsList;

  /// No description provided for @subscriptionTransactionLabel.
  ///
  /// In es, this message translates to:
  /// **'Suscripción'**
  String get subscriptionTransactionLabel;

  /// No description provided for @cancellationTransactionLabel.
  ///
  /// In es, this message translates to:
  /// **'Cancelación'**
  String get cancellationTransactionLabel;

  /// No description provided for @balanceLabel.
  ///
  /// In es, this message translates to:
  /// **'Saldo disponible'**
  String get balanceLabel;

  /// No description provided for @subscribedFundsLabel.
  ///
  /// In es, this message translates to:
  /// **'Fondos suscritos'**
  String get subscribedFundsLabel;

  /// No description provided for @minimumAmountLabel.
  ///
  /// In es, this message translates to:
  /// **'Monto mínimo'**
  String get minimumAmountLabel;

  /// No description provided for @fundCategoryFpv.
  ///
  /// In es, this message translates to:
  /// **'FPV'**
  String get fundCategoryFpv;

  /// No description provided for @fundCategoryFic.
  ///
  /// In es, this message translates to:
  /// **'FIC'**
  String get fundCategoryFic;

  /// No description provided for @notificationMethodLabel.
  ///
  /// In es, this message translates to:
  /// **'Método de notificación'**
  String get notificationMethodLabel;

  /// No description provided for @notificationMethodEmail.
  ///
  /// In es, this message translates to:
  /// **'Email'**
  String get notificationMethodEmail;

  /// No description provided for @notificationMethodSms.
  ///
  /// In es, this message translates to:
  /// **'SMS'**
  String get notificationMethodSms;

  /// No description provided for @subscribeButtonLabel.
  ///
  /// In es, this message translates to:
  /// **'Suscribirse'**
  String get subscribeButtonLabel;

  /// No description provided for @cancelButtonLabel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancelButtonLabel;

  /// No description provided for @confirmButtonLabel.
  ///
  /// In es, this message translates to:
  /// **'Confirmar'**
  String get confirmButtonLabel;

  /// No description provided for @retryButtonLabel.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get retryButtonLabel;

  /// No description provided for @noButtonLabel.
  ///
  /// In es, this message translates to:
  /// **'No'**
  String get noButtonLabel;

  /// No description provided for @yesCancelButtonLabel.
  ///
  /// In es, this message translates to:
  /// **'Sí, cancelar'**
  String get yesCancelButtonLabel;

  /// No description provided for @confirmSubscriptionTitle.
  ///
  /// In es, this message translates to:
  /// **'Confirmar suscripción'**
  String get confirmSubscriptionTitle;

  /// Message asking user to confirm fund subscription
  ///
  /// In es, this message translates to:
  /// **'¿Desea suscribirse a {fundName}?'**
  String confirmSubscriptionMessage(String fundName);

  /// No description provided for @cancelSubscriptionTitle.
  ///
  /// In es, this message translates to:
  /// **'Cancelar suscripción'**
  String get cancelSubscriptionTitle;

  /// Message asking user to confirm fund cancellation
  ///
  /// In es, this message translates to:
  /// **'¿Seguro que deseas cancelar {fundName}?'**
  String cancelSubscriptionMessage(String fundName);

  /// Success message after subscribing to a fund
  ///
  /// In es, this message translates to:
  /// **'Suscripción a {fundName} exitosa'**
  String subscriptionSuccessMessage(String fundName);

  /// Success message after cancelling a fund
  ///
  /// In es, this message translates to:
  /// **'Cancelación de {fundName} exitosa'**
  String cancellationSuccessMessage(String fundName);

  /// No description provided for @errorInsufficientBalance.
  ///
  /// In es, this message translates to:
  /// **'No cuenta con saldo suficiente'**
  String get errorInsufficientBalance;

  /// No description provided for @errorAlreadySubscribed.
  ///
  /// In es, this message translates to:
  /// **'Ya está suscrito a este fondo'**
  String get errorAlreadySubscribed;

  /// No description provided for @errorNotSubscribed.
  ///
  /// In es, this message translates to:
  /// **'No está suscrito a este fondo'**
  String get errorNotSubscribed;

  /// No description provided for @errorConnectionIssue.
  ///
  /// In es, this message translates to:
  /// **'Revisa tu conexión a internet'**
  String get errorConnectionIssue;

  /// No description provided for @errorServerIssue.
  ///
  /// In es, this message translates to:
  /// **'Error del servidor. Intenta más tarde'**
  String get errorServerIssue;

  /// No description provided for @errorGeneric.
  ///
  /// In es, this message translates to:
  /// **'Ocurrió un error inesperado'**
  String get errorGeneric;

  /// No description provided for @subscriptionAmountLabel.
  ///
  /// In es, this message translates to:
  /// **'Monto de suscripción'**
  String get subscriptionAmountLabel;

  /// No description provided for @amountIsRequired.
  ///
  /// In es, this message translates to:
  /// **'El monto es requerido'**
  String get amountIsRequired;

  /// No description provided for @invalidAmountFormat.
  ///
  /// In es, this message translates to:
  /// **'Formato de monto inválido'**
  String get invalidAmountFormat;

  /// Error message when amount is below minimum
  ///
  /// In es, this message translates to:
  /// **'El monto debe ser al menos {minimumAmount}'**
  String amountMustBeAtLeast(String minimumAmount);

  /// No description provided for @minimumLabel.
  ///
  /// In es, this message translates to:
  /// **'Mínimo'**
  String get minimumLabel;

  /// No description provided for @currencyCode.
  ///
  /// In es, this message translates to:
  /// **'COP'**
  String get currencyCode;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
