import 'package:arch_app_flutter/data/repository/user_repository.dart';
import '../../../constant/app_strings.dart';
import '../../../data/model/user.dart';
import '../../../data/remote/api_response.dart';
import 'package:bloc/bloc.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState>{
  DetailCubit({required this.userRepository}):super(
      DetailState(apiResponse: ApiResponse.initial(AppStrings.initializing)));
  final UserRepository userRepository;

  getUserDetailEvent({required String login}) async {
    state.apiResponse = ApiResponse.loading(AppStrings.loading);
    emit(DetailState(apiResponse: ApiResponse.loading(AppStrings.loading)));
    try {
      User user = await userRepository.fetchUserDetails(login);
      emit(DetailState(apiResponse: ApiResponse.completed(user)));
    } catch (e) {
      emit(DetailState(apiResponse: ApiResponse.error(e.toString())));
    }
  }

  get response => state.apiResponse;
}
