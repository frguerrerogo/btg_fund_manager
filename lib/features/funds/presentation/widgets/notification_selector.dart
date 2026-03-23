import 'package:btg_funds/core/core.dart' show LocalizationExtension;
import 'package:btg_funds/core/theme/theme.dart';
import 'package:btg_funds/features/transaction/domain/entities/transaction_entity.dart';
import 'package:flutter/material.dart';

/// A segmented control for choosing a notification method.
///
/// Provides a simple UI for selecting how the user wants to be notified.
class NotificationSelector extends StatefulWidget {
  /// Creates a [NotificationSelector] with an optional initial [initialMethod].
  const NotificationSelector({
    this.initialMethod = NotificationMethod.email,
    super.key,
  });

  /// Initial [NotificationMethod] shown in the control.
  final NotificationMethod initialMethod;

  @override
  State<NotificationSelector> createState() => NotificationSelectorState();
}

/// State for [NotificationSelector].
class NotificationSelectorState extends State<NotificationSelector> {
  late NotificationMethod _selectedMethod;

  @override
  void initState() {
    super.initState();
    _selectedMethod = widget.initialMethod;
  }

  /// Returns the currently selected notification method.
  NotificationMethod get selectedMethod => _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.notificationMethodLabel,
          style: context.textTheme.labelLarge,
        ),
        const SizedBox(height: AppSpacing.md),
        SegmentedButton<NotificationMethod>(
          segments: [
            ButtonSegment(
              value: NotificationMethod.email,
              icon: const Icon(Icons.email_outlined, size: AppSpacing.iconSm),
              label: Text(context.l10n.notificationMethodEmail),
            ),
            ButtonSegment(
              value: NotificationMethod.sms,
              icon: const Icon(Icons.sms_outlined, size: AppSpacing.iconSm),
              label: Text(context.l10n.notificationMethodSms),
            ),
          ],
          selected: {_selectedMethod},
          onSelectionChanged: (value) {
            setState(() => _selectedMethod = value.first);
          },
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact,
          ),
        ),
      ],
    );
  }
}
