import 'package:btg_fund_manager/data/core/providers/providers.dart' show fundsRepositoryProvider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_fund_manager/domain/core/entities.dart';

final fundByIdProvider = FutureProvider.family<Fund, int>((ref, id) async {
  final repository = ref.watch(fundsRepositoryProvider);
  return repository.getFundById(id: id);
});
