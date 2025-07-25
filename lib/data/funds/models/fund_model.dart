import 'package:json_annotation/json_annotation.dart';

part 'fund_model.g.dart';

@JsonSerializable()
class FundModel {

  const FundModel({
    required this.id,
    required this.name,
    required this.minimumAmount,
    required this.currency,
    required this.category,
  });

  factory FundModel.fromJson(Map<String, dynamic> json) => _$FundModelFromJson(json);
  @JsonKey(fromJson: _idFromJson)
  final int id;
  final String name;
  final double minimumAmount;
  final String currency;
  final String category;

  Map<String, dynamic> toJson() => _$FundModelToJson(this);
}

int _idFromJson(dynamic jsonValue) {
  if (jsonValue is int) {
    return jsonValue;
  } else if (jsonValue is String) {
    return int.tryParse(jsonValue) ?? 0;
  }

  throw ArgumentError('Invalid type for ID: $jsonValue');
}
