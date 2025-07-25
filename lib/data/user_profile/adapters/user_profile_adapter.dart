import 'package:btg_fund_manager/data/core/adapters/adapters.dart'
    show Adapter, FundParticipationAdapter;
import 'package:btg_fund_manager/data/core/models/models.dart' show UserProfileModel;
import 'package:btg_fund_manager/domain/core/entities.dart' show UserProfile, NotificationTypeX;

class UserProfileAdapter extends Adapter<UserProfile, UserProfileModel> {

  UserProfileAdapter({required this.fundParticipationAdapter});
  final FundParticipationAdapter fundParticipationAdapter;

  @override
  UserProfileModel entityToModel(UserProfile entity) {
    return UserProfileModel(
      id: entity.id,
      name: entity.name,
      balance: entity.balance,
      participations: entity.participations.map(fundParticipationAdapter.entityToModel).toList(),
      typeNotification: entity.typeNotification.name,
    );
  }

  @override
  UserProfile modelToEntity(UserProfileModel model) {
    return UserProfile(
      id: model.id,
      name: model.name,
      balance: model.balance,
      participations: (model.participations).map(fundParticipationAdapter.modelToEntity).toList(),
      typeNotification: NotificationTypeX.fromJson(model.typeNotification),
    );
  }
}
