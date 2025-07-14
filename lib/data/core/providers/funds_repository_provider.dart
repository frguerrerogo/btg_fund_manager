import 'package:btg_fund_manager/core/core.dart' show Injector;
import 'package:btg_fund_manager/domain/core/repositories.dart' show FundsRepository;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fundsRepositoryProvider = Provider<FundsRepository>((ref) {
  return Injector.container.resolve<FundsRepository>();
});
