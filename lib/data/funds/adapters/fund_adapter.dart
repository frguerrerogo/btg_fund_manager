import 'package:btg_fund_manager/data/core/adapters/adapters.dart' show Adapter;
import 'package:btg_fund_manager/data/core/models/models.dart' show FundModel;
import 'package:btg_fund_manager/domain/core/entities.dart' show Fund;

class FundAdapter extends Adapter<Fund, FundModel> {
  @override
  FundModel entityToModel(Fund entity) {
    return FundModel(
      id: entity.id,
      name: entity.name,
      minimumAmount: entity.minimumAmount,
      currency: entity.currency,
      category: entity.category,
    );
  }

  @override
  Fund modelToEntity(FundModel model) {
    return Fund(
      id: model.id,
      name: model.name,
      minimumAmount: model.minimumAmount,
      currency: model.currency,
      category: model.category,
    );
  }
}
