// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:btg_fund_manager/domain/core/entities.dart' show Fund;

// final fundListProvider = FutureProvider<List<Fund>>((ref) async {
//   // Simulación de delay
//   await Future.delayed(const Duration(seconds: 1));

//   return [
//     Fund(id: '1', name: 'Growth Fund', minimumAmount: 75000, category: 'FPV', currency: 'COP'),
//     Fund(
//       id: '2',
//       name: 'Balanced Portfolio',
//       minimumAmount: 125000,
//       category: 'FIC',
//       currency: 'COP',
//     ),
//     Fund(
//       id: '3',
//       name: 'Tech Innovators Fund',
//       minimumAmount: 100000,
//       category: 'FPV',
//       currency: 'COP',
//     ),
//     Fund(
//       id: '4',
//       name: 'Global Opportunities Fund',
//       minimumAmount: 50000,
//       category: 'FIC',
//       currency: 'COP',
//     ),
//     Fund(
//       id: '5',
//       name: 'Sustainable Future Fund',
//       minimumAmount: 250000,
//       category: 'FPV',
//       currency: 'COP',
//     ),
//   ];
// });

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
