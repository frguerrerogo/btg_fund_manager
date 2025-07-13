// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependency_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _registerDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<FundRemoteDataSource>(
        (c) => FundRemoteDataSourceImpl());
  }

  @override
  void _registerAdapters() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => FundAdapter());
  }

  @override
  void _registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<FundRepository>((c) => FundRepositoryImpl(
        remoteDataSource: c.resolve<FundRemoteDataSource>(),
        adapter: c.resolve<FundAdapter>()));
  }
}
