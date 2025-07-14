import 'package:json_annotation/json_annotation.dart';

part 'fund_participation_model.g.dart';

@JsonSerializable()
class FundParticipationModel {
  final int fundId;
  final String fundName;
  final int amount;

  FundParticipationModel({required this.fundId, required this.fundName, required this.amount});

  factory FundParticipationModel.fromJson(Map<String, dynamic> json) =>
      _$FundParticipationModelFromJson(json);

  Map<String, dynamic> toJson() => _$FundParticipationModelToJson(this);
}
