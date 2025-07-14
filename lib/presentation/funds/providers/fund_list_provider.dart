import 'package:btg_fund_manager/data/core/providers/providers.dart' show fundRepositoryProvider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_fund_manager/domain/core/entities.dart';

final fundListProvider = FutureProvider.autoDispose<List<Fund>>((ref) async {
  final repository = ref.watch(fundRepositoryProvider);
  return await repository.getFunds();
});
