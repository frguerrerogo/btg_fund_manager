import 'package:btg_fund_manager/core/core.dart' show Injector;
import 'package:btg_fund_manager/domain/core/repositories.dart' show FundRepository;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fundRepositoryProvider = Provider<FundRepository>((ref) {
  return Injector.container.resolve<FundRepository>();
});
