import 'package:json_annotation/json_annotation.dart';

part 'fund_model.g.dart';

@JsonSerializable()
class FundModel {
  final int id;
  final String name;
  final double minimumAmount;
  final String currency;
  final String category;

  const FundModel({
    required this.id,
    required this.name,
    required this.minimumAmount,
    required this.currency,
    required this.category,
  });

  factory FundModel.fromJson(Map<String, dynamic> json) => _$FundModelFromJson(json);

  Map<String, dynamic> toJson() => _$FundModelToJson(this);
}
