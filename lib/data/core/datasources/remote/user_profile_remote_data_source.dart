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
    final uri = Uri.parse('$_baseUrl/user_profile');
    final jsonResponse = await HttpHelper.getJsonRequest(uri);

    final Map<String, dynamic> data = RemoteUtils.validateListResponse(jsonResponse)[0];
    return UserProfileModel.fromJson(data);
  }

  @override
  Future<void> updateBalance(int newBalance) async {
    final uri = Uri.parse('$_baseUrl/user_profile/27cb');
    await HttpHelper.patchJsonRequest(uri, {'balance': newBalance});
  }

  @override
  Future<void> updateNotificationType(String typeNotification) async {
    final uri = Uri.parse('$_baseUrl/user_profile/27cb');
    await HttpHelper.patchJsonRequest(uri, {'type_notification': typeNotification});
  }

  @override
  Future<void> updateParticipation(List<dynamic> participations) async {
    final uri = Uri.parse('$_baseUrl/user_profile/27cb');
    await HttpHelper.patchJsonRequest(uri, {'participations': participations});
  }
}
