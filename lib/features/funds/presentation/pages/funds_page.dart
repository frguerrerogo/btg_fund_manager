import 'package:btg_funds/core/core.dart'
    show
        AppConstants,
        AppErrorWidget,
        AppSpacing,
        AppThemeExtension,
        ErrorMappingExtension,
        ErrorWidgetLayout,
        LoadingWidget,
        LocalizationExtension,
        ResponsiveExtension,
        SnackBarExtension;
import 'package:btg_funds/features/funds/domain/domain.dart' show FundEntity;
import 'package:btg_funds/features/funds/presentation/presentation.dart'
    show
        BalanceBanner,
        FundCard,
        FundsBusinessErrorMappingExtension,
        FundsState,
        NotificationSelector,
        NotificationSelectorState,
        fundsControllerProvider;
import 'package:btg_funds/features/transaction/domain/domain.dart' show NotificationMethod;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Displays a browsing interface for available investment funds.
///
/// Allows users to subscribe to and manage their fund subscriptions with balance
/// information and real-time error handling for business operations.
class FundsPage extends ConsumerStatefulWidget {
  /// Creates a [FundsPage].
  const FundsPage({super.key});

  @override
  ConsumerState<FundsPage> createState() => _FundsPageState();
}

/// Manages the state, error handling, and user interactions for the funds browsing interface.
class _FundsPageState extends ConsumerState<FundsPage> {
  late NotificationMethod _notificationMethod;

  ProviderSubscription<AsyncValue<FundsState>>? _errorListener;

  String? _lastErrorMessage;
  DateTime? _lastErrorTime;

  @override
  void initState() {
    super.initState();
    _notificationMethod = NotificationMethod.email;
    _errorListener = _setupErrorListener();
  }

  @override
  void dispose() {
    _errorListener?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fundsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.fundsPageTitle,
          style: context.textTheme.headlineLarge?.copyWith(
            color: context.colors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (error, _) => AppErrorWidget(
          message: error.mapTechnicalErrorToMessage(),
          onRetry: () => ref.invalidate(fundsControllerProvider),
          layout: ErrorWidgetLayout.centered,
        ),
        data: _buildContent,
      ),
    );
  }

  Widget _buildContent(FundsState fundsState) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = constraints.responsiveHorizontalPadding;

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: AppSpacing.screenVertical,
              ),
              sliver: SliverToBoxAdapter(
                child: BalanceBanner(
                  balance: fundsState.user.balance,
                  subscribedCount: fundsState.user.activeSubscriptions.length,
                ),
              ),
            ),

            if (fundsState.funds.isEmpty)
              SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Center(
                    child: Text(
                      context.l10n.emptyFundsList,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: AppSpacing.screenVertical,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final fund = fundsState.funds[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.itemGap),
                        child: FundCard(
                          fund: fund,
                          onSubscribe: () => _onSubscribe(fund),
                          onCancel: () => _onCancel(fund),
                        ),
                      );
                    },
                    childCount: fundsState.funds.length,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  ProviderSubscription<AsyncValue<FundsState>> _setupErrorListener() {
    return ref.listenManual<AsyncValue<FundsState>>(
      fundsControllerProvider,
      (previous, next) {
        if (!next.hasError) return;

        final error = next.error;
        final message = FundsBusinessErrorMappingExtension(
          error,
        ).mapFundsBusinessErrorToMessage(context);

        if (message == null) return;

        final now = DateTime.now();

        final isDuplicate =
            _lastErrorMessage == message &&
            _lastErrorTime != null &&
            now.difference(_lastErrorTime!) < AppConstants.errorDeduplicationWindow;

        if (isDuplicate) return;

        _lastErrorMessage = message;
        _lastErrorTime = now;

        if (mounted) {
          context.showErrorSnackBar(message);
        }
      },
    );
  }

  Future<void> _onSubscribe(FundEntity fund) async {
    final confirmed = await _showSubscribeDialog(fund);
    if (!confirmed) return;

    final success = await ref
        .read(fundsControllerProvider.notifier)
        .subscribeFund(
          fundId: fund.id,
          name: fund.name,
          minimumAmount: fund.minimumAmount,
          notificationMethod: _notificationMethod,
        );

    if (mounted && success) {
      context.showSuccessSnackBar(
        context.l10n.subscriptionSuccessMessage(fund.name),
      );
    }
  }

  Future<void> _onCancel(FundEntity fund) async {
    final confirmed = await _showCancelDialog(fund);
    if (!confirmed) return;

    final success = await ref
        .read(fundsControllerProvider.notifier)
        .cancelFund(
          fundId: fund.id,
          fundName: fund.name,
          amount: fund.minimumAmount,
          notificationMethod: _notificationMethod,
        );

    if (mounted && success) {
      context.showSuccessSnackBar(
        context.l10n.cancellationSuccessMessage(fund.name),
      );
    }
  }

  Future<bool> _showSubscribeDialog(FundEntity fund) async {
    final selectorKey = GlobalKey<NotificationSelectorState>();

    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(context.l10n.confirmSubscriptionTitle),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(context.l10n.confirmSubscriptionMessage(fund.name)),
                const SizedBox(height: AppSpacing.lg),
                NotificationSelector(
                  key: selectorKey,
                  initialMethod: _notificationMethod,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.l10n.cancelButtonLabel),
              ),
              ElevatedButton(
                onPressed: () {
                  _notificationMethod = selectorKey.currentState!.selectedMethod;
                  Navigator.pop(context, true);
                },
                child: Text(context.l10n.confirmButtonLabel),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<bool> _showCancelDialog(FundEntity fund) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(context.l10n.cancelSubscriptionTitle),
            content: Text(
              context.l10n.cancelSubscriptionMessage(fund.name),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.l10n.noButtonLabel),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.error,
                ),
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.l10n.yesCancelButtonLabel),
              ),
            ],
          ),
        ) ??
        false;
  }
}
