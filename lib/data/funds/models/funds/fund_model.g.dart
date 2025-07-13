// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FundModel _$FundModelFromJson(Map<String, dynamic> json) => FundModel(
  id: json['id'] as String,
  name: json['name'] as String,
  minAmount: (json['minAmount'] as num).toInt(),
  currency: json['currency'] as String,
  category: json['category'] as String,
);

Map<String, dynamic> _$FundModelToJson(FundModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'minAmount': instance.minAmount,
  'currency': instance.currency,
  'category': instance.category,
};
