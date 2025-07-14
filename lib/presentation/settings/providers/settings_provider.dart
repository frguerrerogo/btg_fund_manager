import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_fund_manager/domain/core/entities.dart' show NotificationType;

/// Proveedor que mantiene el tipo de notificación seleccionado por el usuario.
/// Por defecto se establece como `email`.
final notificationMethodProvider = StateProvider<NotificationType>((ref) => NotificationType.email);
