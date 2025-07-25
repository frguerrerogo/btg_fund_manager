import 'package:btg_fund_manager/domain/transactions/entities/transaction_type.dart';

class FundTransaction {

  const FundTransaction({
    this.id,
    required this.fundId,
    required this.amount,
    required this.date,
    required this.type,
  });
  final int? id;
  final int fundId;
  final int amount;
  final DateTime date;
  final TransactionType type;
}
