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
          (c) => TransactionsRemoteDataSourceImpl());
  }

  @override
  void _registerAdapters() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => FundAdapter())
      ..registerSingleton((c) => FundTransactionAdapter());
  }

  @override
  void _registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<FundRepository>((c) => FundRepositoryImpl(
        fundsRemoteDataSource: c.resolve<FundsRemoteDataSource>(),
        transactionsRemoteDataSource: c.resolve<TransactionsRemoteDataSource>(),
        fundAdapter: c.resolve<FundAdapter>(),
        fundTransactionAdapter: c.resolve<FundTransactionAdapter>()));
  }
}
