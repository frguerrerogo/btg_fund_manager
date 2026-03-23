// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'BTG Fondos';

  @override
  String get appLogoText => 'BTG';

  @override
  String get fundsTabLabel => 'Fondos';

  @override
  String get historyTabLabel => 'Historial';

  @override
  String get fundsPageTitle => 'Fondos disponibles';

  @override
  String get transactionHistoryPageTitle => 'Historial de transacciones';

  @override
  String get emptyFundsList => 'No hay fondos disponibles';

  @override
  String get emptyTransactionsList => 'No hay transacciones aún';

  @override
  String get subscriptionTransactionLabel => 'Suscripción';

  @override
  String get cancellationTransactionLabel => 'Cancelación';

  @override
  String get balanceLabel => 'Saldo disponible';

  @override
  String get subscribedFundsLabel => 'Fondos suscritos';

  @override
  String get minimumAmountLabel => 'Monto mínimo';

  @override
  String get fundCategoryFpv => 'FPV';

  @override
  String get fundCategoryFic => 'FIC';

  @override
  String get notificationMethodLabel => 'Método de notificación';

  @override
  String get notificationMethodEmail => 'Email';

  @override
  String get notificationMethodSms => 'SMS';

  @override
  String get subscribeButtonLabel => 'Suscribirse';

  @override
  String get cancelButtonLabel => 'Cancelar';

  @override
  String get confirmButtonLabel => 'Confirmar';

  @override
  String get retryButtonLabel => 'Reintentar';

  @override
  String get noButtonLabel => 'No';

  @override
  String get yesCancelButtonLabel => 'Sí, cancelar';

  @override
  String get confirmSubscriptionTitle => 'Confirmar suscripción';

  @override
  String confirmSubscriptionMessage(String fundName) {
    return '¿Desea suscribirse a $fundName?';
  }

  @override
  String get cancelSubscriptionTitle => 'Cancelar suscripción';

  @override
  String cancelSubscriptionMessage(String fundName) {
    return '¿Seguro que deseas cancelar $fundName?';
  }

  @override
  String subscriptionSuccessMessage(String fundName) {
    return 'Suscripción a $fundName exitosa';
  }

  @override
  String cancellationSuccessMessage(String fundName) {
    return 'Cancelación de $fundName exitosa';
  }

  @override
  String get errorInsufficientBalance => 'No cuenta con saldo suficiente';

  @override
  String get errorAlreadySubscribed => 'Ya está suscrito a este fondo';

  @override
  String get errorNotSubscribed => 'No está suscrito a este fondo';

  @override
  String get errorConnectionIssue => 'Revisa tu conexión a internet';

  @override
  String get errorServerIssue => 'Error del servidor. Intenta más tarde';

  @override
  String get errorGeneric => 'Ocurrió un error inesperado';
}
