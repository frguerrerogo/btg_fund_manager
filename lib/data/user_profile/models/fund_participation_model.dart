import 'package:json_annotation/json_annotation.dart';

part 'fund_participation_model.g.dart';

@JsonSerializable()
class FundParticipationModel {

  FundParticipationModel({required this.fundId, required this.fundName, required this.amount});

  factory FundParticipationModel.fromJson(Map<String, dynamic> json) =>
      _$FundParticipationModelFromJson(json);
  final int fundId;
  final String fundName;
  final int amount;

  Map<String, dynamic> toJson() => _$FundParticipationModelToJson(this);
}
