import 'package:arch_app_flutter/data/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
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

  ApiResponse _apiResponse = ApiResponse.initial(AppStrings.initializing);

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> getUserDetail(String login) async {
    _apiResponse = ApiResponse.loading(AppStrings.loading);
    notifyListeners();
    try {
      User userDetail = await userRepository.fetchUserDetails(login);
      _apiResponse = ApiResponse.completed(userDetail);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }



}