import 'package:btg_funds/core/core.dart'
    show AppBorderRadius, AppSpacing, AppThemeExtension, CurrencyFormatter, LocalizationExtension;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text input widget for selecting a subscription amount.
///
/// Provides input validation to ensure the amount is >= minimumAmount
/// and displays the minimum requirement clearly to the user.
class AmountInputSelector extends StatefulWidget {
  /// Creates an [AmountInputSelector].
  const AmountInputSelector({
    required this.minimumAmount,
    this.initialAmount,
    super.key,
  });

  /// The minimum amount allowed for subscription.
  final double minimumAmount;

  /// Initial amount to display in the field (defaults to minimumAmount).
  final double? initialAmount;

  @override
  State<AmountInputSelector> createState() => AmountInputSelectorState();
}

/// State for [AmountInputSelector].
class AmountInputSelectorState extends State<AmountInputSelector> {
  late TextEditingController _amountController;
  late FocusNode _focusNode;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    final initialValue = widget.initialAmount ?? widget.minimumAmount;
    _amountController = TextEditingController(text: initialValue.toStringAsFixed(2));
    _focusNode = FocusNode();
    _amountController.addListener(_validateAmount);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// Validates the current amount and updates error message.
  void _validateAmount() {
    final text = _amountController.text.trim();
    if (text.isEmpty) {
      setState(() => _errorMessage = context.l10n.amountIsRequired);
      return;
    }

    final amount = double.tryParse(text);
    if (amount == null) {
      setState(() => _errorMessage = context.l10n.invalidAmountFormat);
      return;
    }

    if (amount < widget.minimumAmount) {
      setState(
        () => _errorMessage = context.l10n.amountMustBeAtLeast(widget.minimumAmount.formatCOP()),
      );
      return;
    }

    setState(() => _errorMessage = null);
  }

  /// Returns the currently selected amount.
  double get selectedAmount {
    final text = _amountController.text.trim();
    return double.tryParse(text) ?? widget.minimumAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _amountController,
          focusNode: _focusNode,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          style: context.textTheme.titleMedium,
          decoration: InputDecoration(
            labelText: context.l10n.subscriptionAmountLabel,
            labelStyle: context.textTheme.titleMedium,
            hintText: widget.minimumAmount.formatCOP(),
            hintStyle: context.textTheme.bodyMedium,
            suffixText: context.l10n.currencyCode,
            suffixStyle: context.textTheme.bodyMedium,
            errorText: _errorMessage,
            isDense: false,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            border: const OutlineInputBorder(
              borderRadius: AppBorderRadius.brMd,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.brMd,
              borderSide: BorderSide(
                color: context.colors.error,
                width: AppSpacing.xs2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.brMd,
              borderSide: BorderSide(
                color: context.colors.error,
                width: AppSpacing.xs2,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          '${context.l10n.minimumLabel}: ${widget.minimumAmount.formatCOP()}',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
