import 'package:btg_funds/core/core.dart' show dioClientProvider, userRepositoryProvider;
import 'package:btg_funds/features/funds/data/data.dart'
    show FundMapper, FundsRemoteDatasource, FundsRemoteDatasourceImpl, FundsRepositoryImpl;
import 'package:btg_funds/features/funds/domain/domain.dart'
    show CancelFundUseCase, FundsRepository, GetFundsUseCase, SubscribeFundUseCase;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for [FundsRemoteDatasource], backed by [FundsRemoteDatasourceImpl].
final fundsRemoteDatasourceProvider = Provider<FundsRemoteDatasource>((ref) {
  return FundsRemoteDatasourceImpl(ref.read(dioClientProvider));
});

/// Provider for [FundMapper].
final fundMapperProvider = Provider<FundMapper>((ref) {
  return FundMapper();
});

/// Provider for [FundsRepository], backed by [FundsRepositoryImpl].
final fundsRepositoryProvider = Provider<FundsRepository>((ref) {
  return FundsRepositoryImpl(
    fundsDatasource: ref.read(fundsRemoteDatasourceProvider),
    fundMapper: ref.read(fundMapperProvider),
  );
});

/// Provider for [GetFundsUseCase].
final getFundsUseCaseProvider = Provider<GetFundsUseCase>((ref) {
  return GetFundsUseCase(ref.read(fundsRepositoryProvider));
});

/// Provider for [SubscribeFundUseCase].
final subscribeFundUseCaseProvider = Provider<SubscribeFundUseCase>((ref) {
  return SubscribeFundUseCase(
    userRepository: ref.read(userRepositoryProvider),
  );
});

/// Provider for [CancelFundUseCase].
final cancelFundUseCaseProvider = Provider<CancelFundUseCase>((ref) {
  return CancelFundUseCase(
    userRepository: ref.read(userRepositoryProvider),
  );
});
