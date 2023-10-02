import 'package:arch_app_flutter/data/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../constant/app_strings.dart';
import '../../data/local/local_data.dart';
import '../../data/model/user.dart';
import '../../data/remote/api_response.dart';

class DetailViewModel with ChangeNotifier{
  final UserRepository userRepository;
  final LocalData localData;
  DetailViewModel({
    required this.userRepository,
    required this.localData
  });

  final Rx<ApiResponse> _apiResponse = ApiResponse.initial(AppStrings.initializing).obs;

  Rx<ApiResponse> get response {
    return _apiResponse;
  }

  Future<void> getUserDetail(String login) async {
    _apiResponse.value = ApiResponse.loading(AppStrings.loading);
    notifyListeners();
    try {
      User userDetail = await userRepository.fetchUserDetails(login);
      _apiResponse.value = ApiResponse.completed(userDetail);
    } catch (e) {
      _apiResponse.value = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }



}