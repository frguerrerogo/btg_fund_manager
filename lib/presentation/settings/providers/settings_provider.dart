import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:btg_fund_manager/domain/entities/entities.dart' show NotificationType;

final notificationMethodProvider = StateProvider<NotificationType>((ref) => NotificationType.email);
