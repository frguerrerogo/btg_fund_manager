import 'package:btg_fund_manager/domain/transactions/entities/transaction_type.dart';

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
