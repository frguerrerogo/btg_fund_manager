import 'package:kiwi/kiwi.dart';

// DataSources
import 'package:btg_fund_manager/data/core/datasources/remote/remote.dart';

// Adapters
import 'package:btg_fund_manager/data/core/adapters/adapters.dart';

// Repositories
import 'package:btg_fund_manager/data/core/repositories/repositories.dart';
import 'package:btg_fund_manager/domain/core/repositories.dart';

part 'dependency_injector.g.dart';

abstract class Injector {
  static final KiwiContainer container = KiwiContainer();

  static void setup() {
    final injector = _$Injector();
    injector._configure();
  }

  //  DataSources
  @Register.singleton(FundRemoteDataSource, from: FundRemoteDataSourceImpl)
  void _registerDataSources();

  // Adapters
  @Register.singleton(FundAdapter)
  void _registerAdapters();

  // Repositories
  @Register.singleton(FundRepository, from: FundRepositoryImpl)
  void _registerRepositories();

  // Método principal que llama a todos los registros
  void _configure() {
    _registerDataSources();
    _registerAdapters();
    _registerRepositories();
  }
}
