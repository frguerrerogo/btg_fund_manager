import 'package:btg_fund_manager/data/core/adapters/adapters.dart'
    show UserProfileAdapter, FundParticipationAdapter;
import 'package:btg_fund_manager/data/core/datasources/remote/remote.dart'
    show UserProfileRemoteDataSource;
import 'package:btg_fund_manager/domain/core/entities.dart'
    show UserProfile, FundParticipation, NotificationType;
import 'package:btg_fund_manager/domain/core/repositories.dart' show UserProfileRepository;

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource userProfileRemoteDataSource;
  final UserProfileAdapter userProfileAdapter;
  final FundParticipationAdapter fundParticipationAdapter;

  UserProfileRepositoryImpl({
    required this.userProfileRemoteDataSource,
    required this.userProfileAdapter,
    required this.fundParticipationAdapter,
  });

  @override
  Future<UserProfile> getProfile() async {
    final model = await userProfileRemoteDataSource.getProfile();
    return userProfileAdapter.modelToEntity(model);
  }

  @override
  Future<void> updateBalance(int newBalance) async {
    await userProfileRemoteDataSource.updateBalance(newBalance);
  }

  @override
  Future<void> updateNotificationType(NotificationType typeNotification) async {
    await userProfileRemoteDataSource.updateNotificationType(typeNotification.name);
  }

  @override
  Future<void> updateParticipation(List<FundParticipation> participations) async {
    await userProfileRemoteDataSource.updateParticipation(
      participations.map((e) => fundParticipationAdapter.entityToModel(e)).toList(),
    );
  }
}
