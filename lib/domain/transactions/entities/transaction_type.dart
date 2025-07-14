enum TransactionType { subscription, cancellation }

extension TransactionTypeX on TransactionType {
  String get toJson => name;

  static TransactionType fromJson(String value) {
    return TransactionType.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => throw Exception('Tipo no válido: $value'),
    );
  }
}
