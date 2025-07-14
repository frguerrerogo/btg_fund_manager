import 'package:btg_fund_manager/core/core.dart' show Injector;
import 'package:btg_fund_manager/domain/core/repositories.dart' show TransactionsRepository;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionsRepositoryProvider = Provider<TransactionsRepository>((ref) {
  return Injector.container.resolve<TransactionsRepository>();
});
