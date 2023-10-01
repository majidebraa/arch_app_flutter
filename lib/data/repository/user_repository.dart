import 'package:arch_app_flutter/data/remote/remote_module.dart';
import '../local/local_data.dart';
import '../model/user.dart';
import '../remote/const_helper.dart';
import '../remote/header_helper.dart';

class UserRepository {
  final RemoteModule remoteModule;
  final LocalData localData;
  final HeaderHelper headerHelper;
  UserRepository({
    required this.remoteModule,
    required this.localData,
    required this.headerHelper,
  });

  Future<List<User>> fetchUsersList() async {
    // Map<String, String> header = await headerHelper.setHeader(localData);
    dynamic response = await remoteModule.getResponse(baseUrl,
        "${searchUsers}q=majid&sort=followers",RequestType.get);
    final jsonData = response['items'] as List;
    List<User> userList =
        jsonData.map((tagJson) => User.fromJson(tagJson)).toList();
    return userList;
  }

  Future<User> fetchUserDetails(String login) async {
    dynamic response = await remoteModule.getResponse(baseUrl,
        userDetail + login, RequestType.get);
    User user = User.fromJson(response);
    return user;
  }

}
