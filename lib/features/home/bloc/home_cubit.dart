import 'package:arch_app_flutter/data/repository/user_repository.dart';
import '../../../constant/app_strings.dart';
import '../../../data/model/user.dart';
import '../../../data/remote/api_response.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit({required this.userRepository}):super(
      HomeState(apiResponse: ApiResponse.initial(AppStrings.initializing)));
  final UserRepository userRepository;
  getUsersListEvent() async {
    state.apiResponse = ApiResponse.loading(AppStrings.loading);
    emit(HomeState(apiResponse: ApiResponse.loading(AppStrings.loading)));
    try {
      List<User> userList = await userRepository.fetchUsersList();
      emit(HomeState(apiResponse: ApiResponse.completed(userList)));
    } catch (e) {
      emit(HomeState(apiResponse: ApiResponse.error(e.toString())));
    }
  }

  get response => state.apiResponse;
}