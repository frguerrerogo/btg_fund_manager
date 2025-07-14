import 'package:btg_fund_manager/data/core/adapters/adapters.dart' show Adapter;
import 'package:btg_fund_manager/data/core/models/models.dart' show FundParticipationModel;
import 'package:btg_fund_manager/domain/core/entities.dart' show FundParticipation;

class FundParticipationAdapter extends Adapter<FundParticipation, FundParticipationModel> {
  @override
  FundParticipationModel entityToModel(FundParticipation entity) {
    return FundParticipationModel(
      fundId: entity.fundId,
      fundName: entity.fundName,
      amount: entity.amount,
    );
  }

  @override
  FundParticipation modelToEntity(FundParticipationModel model) {
    return FundParticipation(fundId: model.fundId, fundName: model.fundName, amount: model.amount);
  }
}
