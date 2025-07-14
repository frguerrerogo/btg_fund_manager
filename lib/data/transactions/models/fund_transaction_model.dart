import 'package:json_annotation/json_annotation.dart';

part 'fund_transaction_model.g.dart';

@JsonSerializable()
class FundTransactionModel {
  final int? id;
  final int fundId;
  final int amount;
  final String date;
  final String type;

  FundTransactionModel({
    this.id,
    required this.fundId,
    required this.amount,
    required this.date,
    required this.type,
  });

  factory FundTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$FundTransactionModelFromJson(json);

  Map<String, dynamic> toJson() {
    final jsonMap = _$FundTransactionModelToJson(this);
    jsonMap.remove('id');
    return jsonMap;
  }
}
