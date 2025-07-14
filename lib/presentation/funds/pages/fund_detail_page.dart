import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:btg_fund_manager/domain/core/entities.dart' show TransactionType;
import 'package:btg_fund_manager/presentation/funds/widgets/card_info_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold, ButtonCustom;
import 'package:btg_fund_manager/presentation/core/providers.dart'
    show
        fundByIdProvider,
        registerFundTransactionProvider,
        userProfileProvider,
        userBalanceProvider;

class FundDetailPage extends ConsumerWidget {
  final int fundId;

  const FundDetailPage({super.key, required this.fundId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundAsync = ref.watch(fundByIdProvider(fundId));
    final executeTransaction = ref.read(registerFundTransactionProvider);

    final colorScheme = Theme.of(context).colorScheme;

    void showError(String message) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
    }

    void showSuccess(String message) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.green));
    }

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
                  onPressed: () async {
                    final amount = int.tryParse(controller.text.trim());
                    final balance = ref.watch(userBalanceProvider);

                    if (amount == null || amount > balance) {
                      showError('Saldo insuficiente');
                      return;
                    }

                    if (amount == null || amount < fund.minimumAmount) {
                      showError('Monto inválido');
                      return;
                    }

                    try {
                      await executeTransaction(
                        fundId: fund.id,
                        amount: amount,
                        type: TransactionType.subscription,
                      );
                      ref.read(userProfileProvider.notifier).updateBalance(balance - amount);
                      showSuccess('Suscripción realizada');
                    } catch (e) {
                      showError(e.toString());
                    }
                    showSuccess('Participación suscrita con éxito');
                  },
                ),
                const SizedBox(height: 15),
                ButtonCustom(
                  enable: true,
                  text: 'Cancelar participación',
                  onPressed: () async {
                    final amount = int.tryParse(controller.text.trim());
                    if (amount == null || amount < fund.minimumAmount) {
                      showError('Monto inválido');
                      return;
                    }
                    try {
                      await executeTransaction(
                        fundId: fund.id,
                        amount: amount,
                        type: TransactionType.cancellation,
                      );
                      ref.read(userProfileProvider.notifier).updateBalance(600000);
                      showSuccess('Suscripción cancelada');
                    } catch (e) {
                      showError(e.toString());
                    }
                    showSuccess('Participación cancelada con éxito');
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
