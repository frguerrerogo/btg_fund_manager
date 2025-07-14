import 'package:btg_fund_manager/core/core.dart' show Injector;
import 'package:btg_fund_manager/domain/core/repositories.dart' show UserProfileRepository;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  return Injector.container.resolve<UserProfileRepository>();
});
