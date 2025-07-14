import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:btg_fund_manager/domain/core/entities.dart' show NotificationType;
import 'package:btg_fund_manager/presentation/core/providers.dart' show notificationMethodProvider;
import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold;

import 'package:btg_fund_manager/presentation/settings/widgets/notification_option_card.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMethod = ref.watch(notificationMethodProvider);

    return AppScaffold(
      title: 'Configuración',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Elige cómo te gustaría recibir notificaciones",
              style: AppTextStyles.titleMedium(context),
            ),
            const SizedBox(height: 24),
            NotificationOptionCard(
              selected: selectedMethod == NotificationType.email,
              title: 'Email',
              subtitle: 'Recibir notificaciones por correo electrónico',
              onTap: () =>
                  ref.read(notificationMethodProvider.notifier).state = NotificationType.email,
            ),
            const SizedBox(height: 12),
            NotificationOptionCard(
              selected: selectedMethod == NotificationType.sms,
              title: 'SMS',
              subtitle: 'Recibir notificaciones vía SMS',
              onTap: () =>
                  ref.read(notificationMethodProvider.notifier).state = NotificationType.sms,
            ),
            const Spacer(),
            ButtonCustom(text: 'Guardar'),
          ],
        ),
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Notification preferences saved')));
        },
        child: Text(text, style: AppTextStyles.bodyMedium(context).copyWith(color: Colors.white)),
      ),
    );
  }
}
