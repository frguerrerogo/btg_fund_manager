import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:btg_fund_manager/domain/core/entities.dart' show NotificationType;
import 'package:btg_fund_manager/presentation/core/providers.dart'
    show notificationMethodProvider, userProfileProvider;
import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold, ButtonCustom;

import 'package:btg_fund_manager/presentation/settings/widgets/notification_option_card.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final profileAsync = ref.read(userProfileProvider);
    profileAsync.whenOrNull(
      data: (profile) {
        final current = ref.read(notificationMethodProvider);
        final fromProfile = profile.typeNotification;

        if (current != fromProfile) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(notificationMethodProvider.notifier).state = fromProfile;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedMethod = ref.watch(notificationMethodProvider);
    final profileAsync = ref.watch(userProfileProvider);

    return AppScaffold(
      title: 'Configuración',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: profileAsync.when(
          data: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Elige cómo te gustaría recibir notificaciones",
                  style: AppTextStyles.titleMedium(context),
                ),
                const SizedBox(height: 20),
                NotificationOptionCard(
                  selected: selectedMethod == NotificationType.email,
                  title: 'Email',
                  subtitle: 'Recibir notificaciones por correo electrónico',
                  onTap: () {
                    ref.read(notificationMethodProvider.notifier).state = NotificationType.email;
                  },
                ),
                const SizedBox(height: 15),
                NotificationOptionCard(
                  selected: selectedMethod == NotificationType.sms,
                  title: 'SMS',
                  subtitle: 'Recibir notificaciones vía SMS',
                  onTap: () {
                    ref.read(notificationMethodProvider.notifier).state = NotificationType.sms;
                  },
                ),
                const SizedBox(height: 12),
                ButtonCustom(
                  text: 'Guardar',
                  onPressed: () {
                    final selected = ref.read(notificationMethodProvider);
                    ref.read(userProfileProvider.notifier).updateNotification(selected);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tipo de notificación guardado'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ],
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
        ),
      ),
    );
  }
}
