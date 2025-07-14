import 'package:btg_fund_manager/domain/core/entities.dart'
    show NotificationType, UserProfile, FundParticipation;

abstract class UserProfileRepository {
  Future<UserProfile> getProfile();
  Future<void> updateBalance(int newBalance);
  Future<void> updateParticipation(List<FundParticipation> participations);
  Future<void> updateNotificationType(NotificationType typeNotification);
}
