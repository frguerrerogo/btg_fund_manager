// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FundTransactionModel _$FundTransactionModelFromJson(
        Map<String, dynamic> json) =>
    FundTransactionModel(
      id: (json['id'] as num?)?.toInt(),
      fundId: (json['fundId'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      date: json['date'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$FundTransactionModelToJson(
        FundTransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fundId': instance.fundId,
      'amount': instance.amount,
      'date': instance.date,
      'type': instance.type,
    };
