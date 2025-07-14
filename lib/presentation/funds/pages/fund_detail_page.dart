import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:btg_fund_manager/presentation/funds/widgets/card_info_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold, ButtonCustom;
import 'package:btg_fund_manager/presentation/core/providers.dart' show fundByIdProvider;

class FundDetailPage extends ConsumerWidget {
  final int fundId;

  const FundDetailPage({super.key, required this.fundId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundAsync = ref.watch(fundByIdProvider(fundId));
    final colorScheme = Theme.of(context).colorScheme;

    return fundAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (fund) {
        final controller = TextEditingController();

        return AppScaffold(
          title: fund.name,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descripción general del fondo', style: AppTextStyles.titleMedium(context)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: CardInfoCustom(title: 'Categoría', category: fund.category),
                    ),
                    Expanded(
                      child: CardInfoCustom(
                        title: 'Monto mínimo',
                        category: '${fund.minimumAmount} ${fund.currency}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: 'Ingrese el monto',
                    filled: true,
                    fillColor: const Color(0xFFF3F4F6),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ButtonCustom(
                  text: 'Suscribir',
                  onPressed: () {
                    // Acción aquí
                  },
                ),
                const SizedBox(height: 15),
                ButtonCustom(
                  enable: false,
                  text: 'Cancelar participación',
                  onPressed: () {
                    // Acción aquí
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
