import 'package:btg_funds/core/core.dart' show dioClientProvider;
import 'package:btg_funds/features/user/data/data.dart'
    show
        ActiveSubscriptionMapper,
        UserMapper,
        UserRemoteDatasource,
        UserRemoteDatasourceImpl,
        UserRepositoryImpl;
import 'package:btg_funds/features/user/domain/domain.dart'
    show GetUserUseCase, UserRepository, ValidateBalanceUseCase;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for [UserRemoteDatasource], backed by [UserRemoteDatasourceImpl].
final userRemoteDatasourceProvider = Provider<UserRemoteDatasource>((ref) {
  return UserRemoteDatasourceImpl(ref.read(dioClientProvider));
});

/// Provider for [ActiveSubscriptionMapper].
final activeSubscriptionMapperProvider = Provider<ActiveSubscriptionMapper>((ref) {
  return ActiveSubscriptionMapper();
});

/// Provider for [UserMapper].
final userMapperProvider = Provider<UserMapper>((ref) {
  return UserMapper(
    activeSubscriptionMapper: ref.read(activeSubscriptionMapperProvider),
  );
});

/// Provider for [UserRepository], backed by [UserRepositoryImpl].
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    userDatasource: ref.read(userRemoteDatasourceProvider),
    userMapper: ref.read(userMapperProvider),
    activeSubscriptionMapper: ref.read(activeSubscriptionMapperProvider),
  );
});

/// Provider for [GetUserUseCase].
final getUserUseCaseProvider = Provider<GetUserUseCase>((ref) {
  return GetUserUseCase(ref.read(userRepositoryProvider));
});

/// Provider for [ValidateBalanceUseCase].
final validateBalanceUseCaseProvider = Provider<ValidateBalanceUseCase>((ref) {
  return ValidateBalanceUseCase(ref.read(userRepositoryProvider));
});
