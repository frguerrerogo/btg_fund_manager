import 'package:btg_fund_manager/domain/core/entities.dart'
    show NotificationType, FundParticipation;

class UserProfile {

  const UserProfile({
    required this.id,
    required this.name,
    required this.balance,
    required this.typeNotification,
    required this.participations,
  });
  final String id;
  final String name;
  final int balance;
  final NotificationType typeNotification;
  final List<FundParticipation> participations;
}
