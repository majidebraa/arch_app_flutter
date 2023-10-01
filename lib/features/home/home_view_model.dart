import 'package:arch_app_flutter/data/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import '../../constant/app_strings.dart';
import '../../data/local/local_data.dart';
import '../../data/model/user.dart';
import '../../data/remote/api_response.dart';

class HomeViewModel with ChangeNotifier{
  final UserRepository userRepository;
  final LocalData localData;
  HomeViewModel({
    required this.userRepository,
    required this.localData
  });

  ApiResponse _apiResponse = ApiResponse.initial(AppStrings.initializing);

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> getUsersList() async {
    _apiResponse = ApiResponse.loading(AppStrings.loading);
    notifyListeners();
    try {
      List<User> userList = await userRepository.fetchUsersList();
      _apiResponse = ApiResponse.completed(userList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }



}