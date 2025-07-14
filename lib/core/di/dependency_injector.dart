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
  @Register.singleton(FundsRemoteDataSource, from: FundsRemoteDataSourceImpl)
  @Register.singleton(TransactionsRemoteDataSource, from: TransactionsRemoteDataSourceImpl)
  @Register.singleton(UserProfileRemoteDataSource, from: UserProfileRemoteDataSourceImpl)
  void _registerDataSources();

  // Adapters
  @Register.singleton(FundAdapter)
  @Register.singleton(FundTransactionAdapter)
  @Register.singleton(UserProfileAdapter)
  @Register.singleton(FundParticipationAdapter)
  void _registerAdapters();

  // Repositories
  @Register.singleton(FundsRepository, from: FundsRepositoryImpl)
  @Register.singleton(TransactionsRepository, from: TransactionsRepositoryImpl)
  @Register.singleton(UserProfileRepository, from: UserProfileRepositoryImpl)
  void _registerRepositories();

  // Método principal que llama a todos los registros
  void _configure() {
    _registerDataSources();
    _registerAdapters();
    _registerRepositories();
  }
}
