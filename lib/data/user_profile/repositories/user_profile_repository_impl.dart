import 'package:btg_fund_manager/data/core/adapters/adapters.dart' show UserProfileAdapter;
import 'package:btg_fund_manager/data/core/datasources/remote/remote.dart'
    show UserProfileRemoteDataSource;
import 'package:btg_fund_manager/domain/core/entities.dart'
    show UserProfile, FundParticipation, NotificationType;
import 'package:btg_fund_manager/domain/core/repositories.dart' show UserProfileRepository;

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource userProfileRemoteDataSource;
  final UserProfileAdapter userProfileAdapter;

  UserProfileRepositoryImpl({
    required this.userProfileRemoteDataSource,
    required this.userProfileAdapter,
  });

  @override
  Future<UserProfile> getProfile() async {
    final model = await userProfileRemoteDataSource.getProfile();
    return userProfileAdapter.modelToEntity(model);
  }

  @override
  Future<void> updateBalance(int newBalance) {
    // TODO: implement updateBalance
    throw UnimplementedError();
  }

  @override
  Future<void> updateNotificationType(NotificationType typeNotification) {
    // TODO: implement updateNotificationType
    throw UnimplementedError();
  }

  @override
  Future<void> updateParticipation(List<FundParticipation> participations) {
    // TODO: implement updateParticipation
    throw UnimplementedError();
  }
}
