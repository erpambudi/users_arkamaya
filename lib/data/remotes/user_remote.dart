import 'package:users_arkamaya/core/network/helpers/base_remote_source.dart';
import 'package:users_arkamaya/core/network/helpers/dio_provider.dart';
import 'package:users_arkamaya/data/models/user_detail_model.dart';
import 'package:users_arkamaya/data/models/user_model.dart';

abstract class UserRemote {
  Future<List<UserDataModel>> getUsers();
  Future<UserDetailModel> getDetailUsers(int id);
  Future<NewUserModel> addUser(String name, String job);
}

class UserRemoteImpl extends BaseRemoteSource implements UserRemote {
  @override
  Future<List<UserDataModel>> getUsers() {
    try {
      final dioCall = dioClient.get("${DioProvider.baseUrl}/users");

      return callApiWithErrorParser(dioCall).then((response) {
        return UsersResponse.fromJson(response.data).data;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDetailModel> getDetailUsers(int id) {
    try {
      final dioCall = dioClient.get("${DioProvider.baseUrl}/users/$id");

      return callApiWithErrorParser(dioCall).then((response) {
        return UserDetailModel.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NewUserModel> addUser(String name, String job) {
    try {
      var body = {"name": name, "job": job};

      final dioCall =
          dioClient.post("${DioProvider.baseUrl}/users", data: body);

      return callApiWithErrorParser(dioCall).then((response) {
        return NewUserModel.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }
}
