import 'package:btg_fund_manager/data/core/providers/providers.dart'
    show userProfileRepositoryProvider;
import 'package:btg_fund_manager/domain/core/entities.dart'
    show UserProfile, FundParticipation, NotificationType;
import 'package:btg_fund_manager/domain/core/repositories.dart' show UserProfileRepository;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileProvider = AsyncNotifierProvider<UserProfileNotifier, UserProfile>(
  UserProfileNotifier.new,
);

final userBalanceProvider = Provider<int>((ref) {
  final profile = ref.watch(userProfileProvider).value;
  return profile?.balance ?? 0;
});

class UserProfileNotifier extends AsyncNotifier<UserProfile> {
  late final UserProfileRepository _repository;

  @override
  Future<UserProfile> build() async {
    _repository = ref.watch(userProfileRepositoryProvider);
    return await _repository.getProfile();
  }

  Future<void> updateBalance(int newBalance) async {
    await _repository.updateBalance(newBalance);
    state = AsyncData(await _repository.getProfile());
  }

  Future<void> updateNotification(NotificationType newType) async {
    await _repository.updateNotificationType(newType);
    state = AsyncData(await _repository.getProfile());
  }

  Future<void> updateParticipations(List<FundParticipation> participations) async {
    await _repository.updateParticipation(participations);
    state = AsyncData(await _repository.getProfile());
  }

  void refreshProfile() async {
    state = AsyncLoading();
    state = AsyncData(await _repository.getProfile());
  }
}
