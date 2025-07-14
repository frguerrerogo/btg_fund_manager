// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_participation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FundParticipationModel _$FundParticipationModelFromJson(
        Map<String, dynamic> json) =>
    FundParticipationModel(
      fundId: (json['fundId'] as num).toInt(),
      fundName: json['fundName'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$FundParticipationModelToJson(
        FundParticipationModel instance) =>
    <String, dynamic>{
      'fundId': instance.fundId,
      'fundName': instance.fundName,
      'amount': instance.amount,
    };
