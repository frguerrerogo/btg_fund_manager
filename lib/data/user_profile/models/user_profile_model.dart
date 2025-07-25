import 'package:btg_fund_manager/data/user_profile/models/fund_participation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {

  UserProfileModel({
    required this.id,
    required this.name,
    required this.balance,
    required this.typeNotification,
    required this.participations,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);
  final String id;
  final String name;
  final int balance;
  @JsonKey(name: 'type_notification')
  final String typeNotification;
  final List<FundParticipationModel> participations;
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}
