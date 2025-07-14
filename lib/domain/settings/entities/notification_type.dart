enum NotificationType { email, sms }

extension NotificationTypeX on NotificationType {
  String get toJson => name;

  static NotificationType fromJson(String value) {
    return NotificationType.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => throw Exception('Tipo no válido: $value'),
    );
  }
}
