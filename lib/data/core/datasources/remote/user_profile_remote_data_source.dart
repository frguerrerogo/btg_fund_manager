import 'package:btg_fund_manager/data/core/datasources/remote/core/http_helper.dart';
import 'package:btg_fund_manager/data/core/datasources/remote/core/remote_utils.dart';
import 'package:btg_fund_manager/data/core/models/models.dart'
    show UserProfileModel, FundParticipationModel;

const String _baseUrl = 'http://localhost:3000';

abstract class UserProfileRemoteDataSource {
  Future<UserProfileModel> getProfile();
  Future<void> updateBalance(int newBalance);
  Future<void> updateParticipation(List<FundParticipationModel> participations);
  Future<void> updateNotificationType(String typeNotification);
}

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  UserProfileRemoteDataSourceImpl();

  @override
  Future<UserProfileModel> getProfile() async {
    final uri = Uri.parse('$_baseUrl/user_pofile');
    final jsonResponse = await HttpHelper.getJsonRequest(uri);

    final Map<String, dynamic> data = RemoteUtils.validateMapResponse(jsonResponse);
    return UserProfileModel.fromJson(data);
  }

  @override
  Future<void> updateBalance(int newBalance) {
    // TODO: implement updateBalance
    throw UnimplementedError();
  }

  @override
  Future<void> updateNotificationType(typeNotification) {
    // TODO: implement updateNotificationType
    throw UnimplementedError();
  }

  @override
  Future<void> updateParticipation(List<dynamic> participations) {
    // TODO: implement updateParticipation
    throw UnimplementedError();
  }

  // @override
  // Future<void> postSubscriptionToFund(FundTransactionModel data) async {
  //   final uri = Uri.parse('$_baseUrl/transactions');
  //   await HttpHelper.postJsonRequest(uri, data.toJson());
  // }
}
