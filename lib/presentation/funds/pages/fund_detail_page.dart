import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:btg_fund_manager/domain/core/entities.dart' show TransactionType, Fund;
import 'package:btg_fund_manager/domain/user_profile/entities/fund_participation.dart';
import 'package:btg_fund_manager/presentation/core/providers.dart'
    show
        fundByIdProvider,
        registerFundTransactionProvider,
        userProfileProvider,
        userBalanceProvider;
import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold, ButtonCustom;
import 'package:btg_fund_manager/presentation/funds/widgets/card_info_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FundDetailPage extends ConsumerStatefulWidget {

  const FundDetailPage({super.key, required this.fundId});
  final int fundId;

  @override
  ConsumerState<FundDetailPage> createState() => _FundDetailPageState();
}

class _FundDetailPageState extends ConsumerState<FundDetailPage> {
  final TextEditingController controller = TextEditingController();

  void _showMessage(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: isError ? Colors.red : Colors.green),
    );
  }

  /// Maneja la lógica de suscripción o cancelación.
  ///
  /// Valida condiciones como monto mínimo y saldo disponible para suscripción.
  /// Para cancelaciones, suma el total invertido y lo reintegra al balance.
  Future<void> _handleTransaction({
    required BuildContext context,
    required Fund fund,
    required int amount,
    required int balance,
    required TransactionType type,
    required List<FundParticipation> participations,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    final fundId = fund.id;
    final minAmount = fund.minimumAmount;
    final profileNotifier = ref.read(userProfileProvider.notifier);
    final executeTransaction = ref.read(registerFundTransactionProvider);

    if (type == TransactionType.subscription) {
      if (amount < minAmount) {
        messenger.showSnackBar(
          const SnackBar(content: Text('Monto inválido'), backgroundColor: Colors.red),
        );
        return;
      }
      if (amount > balance) {
        messenger.showSnackBar(
          const SnackBar(content: Text('Saldo insuficiente'), backgroundColor: Colors.red),
        );
        return;
      }
    }

    try {
      if (!mounted) return;

      if (type == TransactionType.subscription) {
        final newParticipation = FundParticipation(
          amount: amount,
          fundId: fundId,
          fundName: fund.name,
        );

        profileNotifier.updateBalance(balance - amount);
        profileNotifier.updateParticipations([...participations, newParticipation]);

        await executeTransaction(fundId: fundId, amount: amount, type: type);
      } else {
        final participationsToCancel = participations.where((p) => p.fundId == fundId).toList();

        if (participationsToCancel.isEmpty) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text('No hay participaciones para cancelar'),
              backgroundColor: Colors.orange,
            ),
          );
          return;
        }

        final totalCancelAmount = participationsToCancel.fold<int>(0, (sum, p) => sum + p.amount);
        final remainingParticipations = participations.where((p) => p.fundId != fundId).toList();

        profileNotifier.updateBalance(balance + totalCancelAmount);
        profileNotifier.updateParticipations(remainingParticipations);

        await executeTransaction(fundId: fundId, amount: totalCancelAmount, type: type);
      }

      final successMessage = type == TransactionType.subscription
          ? 'Suscripción realizada con éxito'
          : 'Cancelación realizada con éxito';

      messenger.showSnackBar(
        SnackBar(content: Text(successMessage), backgroundColor: Colors.green),
      );
    } catch (e) {
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final fundAsync = ref.watch(fundByIdProvider(widget.fundId));
    final profileAsync = ref.watch(userProfileProvider);
    final balance = ref.watch(userBalanceProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return profileAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (profile) => fundAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (fund) {
          return AppScaffold(
            title: fund.name,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Información general del fondo
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

                  // Campo para ingresar monto
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

                  // Botón para suscripción
                  Align(
                    alignment: Alignment.centerRight,
                    child: ButtonCustom(
                      text: 'Suscribir',
                      onPressed: () {
                        final amount = int.tryParse(controller.text.trim());
                        if (amount == null) {
                          _showMessage(context, 'Ingrese un monto válido', isError: true);
                          return;
                        }
                        _handleTransaction(
                          context: context,
                          fund: fund,
                          amount: amount,
                          balance: balance,
                          type: TransactionType.subscription,
                          participations: profile.participations,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Botón para cancelar participación
                  Align(
                    alignment: Alignment.centerRight,
                    child: ButtonCustom(
                      enable: profile.participations.any((p) => p.fundId == fund.id),
                      text: 'Cancelar participación',
                      onPressed: () {
                        final amount = int.tryParse(controller.text.trim()) ?? 0;
                        _handleTransaction(
                          context: context,
                          fund: fund,
                          amount: amount,
                          balance: balance,
                          type: TransactionType.cancellation,
                          participations: profile.participations,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
