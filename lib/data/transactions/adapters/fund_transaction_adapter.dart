import 'package:btg_fund_manager/data/core/adapters/adapter_utils.dart';
import 'package:btg_fund_manager/data/core/adapters/adapters.dart' show Adapter;
import 'package:btg_fund_manager/data/core/models/models.dart' show FundTransactionModel;
import 'package:btg_fund_manager/domain/core/entities.dart' show FundTransaction, TransactionTypeX;

class FundTransactionAdapter extends Adapter<FundTransaction, FundTransactionModel> {
  @override
  FundTransactionModel entityToModel(FundTransaction entity) {
    return FundTransactionModel(
      fundId: entity.fundId,
      amount: entity.amount,
      date: AdapterUtils.dateToJson(entity.date),
      type: entity.type.name,
    );
  }

  @override
  FundTransaction modelToEntity(FundTransactionModel model) {
    return FundTransaction(
      fundId: model.fundId,
      amount: model.amount,
      date: AdapterUtils.dateFromJson(model.date),
      type: TransactionTypeX.fromJson(model.type),
    );
  }
}
