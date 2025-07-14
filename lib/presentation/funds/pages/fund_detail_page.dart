import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold;
import 'package:btg_fund_manager/presentation/core/providers.dart' show fundByIdProvider;

class FundDetailPage extends ConsumerWidget {
  final int fundId;

  const FundDetailPage({super.key, required this.fundId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundAsync = ref.watch(fundByIdProvider(fundId));

    return fundAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (fund) {
        final controller = TextEditingController();

        return AppScaffold(
          title: 'Fund Details',
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const SizedBox(height: 16),
                Text(fund.name, style: Theme.of(context).textTheme.titleLarge),
                //Text('Managed by ${fund.manager}', style: TextStyle(color: Colors.grey.shade600)),
                //Text('Risk Level: ${fund.riskLevel}', style: TextStyle(color: Colors.grey.shade600)),
                const SizedBox(height: 24),
                Text('Fund Overview', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                //Text(fund.overview, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 24),
                Text('Suscripción', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese el monto',
                    filled: true,
                    fillColor: Color(0xFFF3F4F6),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // lógica de suscripción aquí
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Suscribir'),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      // lógica de cancelación aquí
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE5E7EB)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Cancelar participación'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
