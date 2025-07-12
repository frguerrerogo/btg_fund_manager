enum TransactionType { subscription, cancellation }

class FundTransaction {
  final String fundId;
  final double amount;
  final DateTime date;
  final TransactionType type;

  const FundTransaction({
    required this.fundId,
    required this.amount,
    required this.date,
    required this.type,
  });
}
