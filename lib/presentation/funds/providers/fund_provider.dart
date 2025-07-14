import 'package:btg_fund_manager/core/core.dart' show Injector;
import 'package:btg_fund_manager/domain/core/repositories.dart' show FundRepository;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_fund_manager/domain/core/entities.dart';

final fundRepositoryProvider = Provider<FundRepository>((ref) {
  return Injector.container.resolve<FundRepository>();
});

final fundListProvider = FutureProvider<List<Fund>>((ref) async {
  final repository = ref.watch(fundRepositoryProvider);
  return await repository.getFunds();
});

final fundByIdProvider = FutureProvider.family<Fund, int>((ref, id) async {
  final repository = ref.watch(fundRepositoryProvider);
  return repository.getFundById(id: id);
});

final subscribeToFundProvider = FutureProvider.family<void, (int fundId, int amount)>((
  ref,
  tuple,
) async {
  final (fundId, amount) = tuple;
  final data = FundTransaction(
    fundId: fundId,
    amount: amount,
    date: DateTime.now(),
    type: TransactionType.subscription,
  );

  final repository = ref.watch(fundRepositoryProvider);
  await repository.postSubscriptionToFund(data);
});
