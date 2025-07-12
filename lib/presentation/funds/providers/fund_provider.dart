import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_fund_manager/domain/entities/entities.dart' show Fund;

final fundListProvider = FutureProvider<List<Fund>>((ref) async {
  // Simulación de delay
  await Future.delayed(const Duration(seconds: 1));

  return [
    Fund(id: '1', name: 'Growth Fund', minimumAmount: 75000, category: 'FPV'),
    Fund(id: '2', name: 'Balanced Portfolio', minimumAmount: 125000, category: 'FIC'),
    Fund(id: '3', name: 'Tech Innovators Fund', minimumAmount: 100000, category: 'FPV'),
    Fund(id: '4', name: 'Global Opportunities Fund', minimumAmount: 50000, category: 'FIC'),
    Fund(id: '5', name: 'Sustainable Future Fund', minimumAmount: 250000, category: 'FPV'),
  ];
});
