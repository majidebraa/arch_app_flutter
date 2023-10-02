import 'package:arch_app_flutter/data/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../constant/app_strings.dart';
import '../../data/local/local_data.dart';
import '../../data/model/user.dart';
import '../../data/remote/api_response.dart';

class HomeViewModel extends GetxController{
  final UserRepository userRepository;
  final LocalData localData;
  HomeViewModel({
    required this.userRepository,
    required this.localData
  });

  final Rx<ApiResponse> _apiResponse = ApiResponse.initial(AppStrings.initializing).obs;

  Rx<ApiResponse> get response {
    return _apiResponse;
  }

  Future<void> getUsersList() async {
    _apiResponse.value = ApiResponse.loading(AppStrings.loading);
    try {
      List<User> userList = await userRepository.fetchUsersList();
      _apiResponse.value = ApiResponse.completed(userList);
    } catch (e) {
      _apiResponse.value = ApiResponse.error(e.toString());
    }
  }



}