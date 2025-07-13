import 'package:json_annotation/json_annotation.dart';

part 'fund_model.g.dart';

@JsonSerializable()
class FundModel {
  final String id;
  final String name;
  final int minAmount;
  final String currency;
  final String category;

  const FundModel({
    required this.id,
    required this.name,
    required this.minAmount,
    required this.currency,
    required this.category,
  });

  factory FundModel.fromJson(Map<String, dynamic> json) => _$FundModelFromJson(json);

  Map<String, dynamic> toJson() => _$FundModelToJson(this);
}
