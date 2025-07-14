import 'package:btg_fund_manager/data/core/providers/providers.dart'
    show userProfileRepositoryProvider;
import 'package:btg_fund_manager/domain/core/entities.dart'
    show UserProfile, FundParticipation, NotificationType;
import 'package:btg_fund_manager/domain/core/repositories.dart' show UserProfileRepository;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Proveedor que expone el perfil del usuario y permite actualizarlo.
final userProfileProvider = AsyncNotifierProvider<UserProfileNotifier, UserProfile>(
  UserProfileNotifier.new,
);

/// Proveedor derivado que expone únicamente el saldo del usuario.
/// Si no hay perfil cargado, devuelve 0.
final userBalanceProvider = Provider<int>((ref) {
  final profile = ref.watch(userProfileProvider).value;
  return profile?.balance ?? 0;
});

/// Notificador encargado de manejar la lógica relacionada con el perfil del usuario.
class UserProfileNotifier extends AsyncNotifier<UserProfile> {
  late final UserProfileRepository _repository;

  /// Inicializa el repositorio y carga el perfil del usuario.
  @override
  Future<UserProfile> build() async {
    _repository = ref.watch(userProfileRepositoryProvider);
    return await _repository.getProfile();
  }

  /// Actualiza el saldo del usuario y recarga el perfil.
  Future<void> updateBalance(int newBalance) async {
    await _repository.updateBalance(newBalance);
    state = AsyncData(await _repository.getProfile());
  }

  /// Actualiza el tipo de notificación del usuario y recarga el perfil.
  Future<void> updateNotification(NotificationType newType) async {
    await _repository.updateNotificationType(newType);
    state = AsyncData(await _repository.getProfile());
  }

  /// Actualiza las participaciones del usuario en fondos y recarga el perfil.
  Future<void> updateParticipations(List<FundParticipation> participations) async {
    await _repository.updateParticipation(participations);
    state = AsyncData(await _repository.getProfile());
  }

  /// Fuerza la recarga del perfil del usuario.
  void refreshProfile() async {
    state = AsyncLoading();
    state = AsyncData(await _repository.getProfile());
  }
}
