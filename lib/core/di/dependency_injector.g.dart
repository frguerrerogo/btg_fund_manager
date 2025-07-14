// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependency_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _registerDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<FundsRemoteDataSource>(
          (c) => FundsRemoteDataSourceImpl())
      ..registerSingleton<TransactionsRemoteDataSource>(
          (c) => TransactionsRemoteDataSourceImpl())
      ..registerSingleton<UserProfileRemoteDataSource>(
          (c) => UserProfileRemoteDataSourceImpl());
  }

  @override
  void _registerAdapters() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => FundAdapter())
      ..registerSingleton((c) => FundTransactionAdapter())
      ..registerSingleton((c) => UserProfileAdapter(
          fundParticipationAdapter: c.resolve<FundParticipationAdapter>()))
      ..registerSingleton((c) => FundParticipationAdapter());
  }

  @override
  void _registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<FundsRepository>((c) => FundsRepositoryImpl(
          fundsRemoteDataSource: c.resolve<FundsRemoteDataSource>(),
          transactionsRemoteDataSource:
              c.resolve<TransactionsRemoteDataSource>(),
          fundAdapter: c.resolve<FundAdapter>(),
          fundTransactionAdapter: c.resolve<FundTransactionAdapter>()))
      ..registerSingleton<TransactionsRepository>((c) =>
          TransactionsRepositoryImpl(
              transactionsRemoteDataSource:
                  c.resolve<TransactionsRemoteDataSource>(),
              fundTransactionAdapter: c.resolve<FundTransactionAdapter>()))
      ..registerSingleton<UserProfileRepository>((c) =>
          UserProfileRepositoryImpl(
              userProfileRemoteDataSource:
                  c.resolve<UserProfileRemoteDataSource>(),
              userProfileAdapter: c.resolve<UserProfileAdapter>(),
              fundParticipationAdapter: c.resolve<FundParticipationAdapter>()));
  }
}
