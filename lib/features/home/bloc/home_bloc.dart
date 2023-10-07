import 'package:arch_app_flutter/data/repository/user_repository.dart';
import '../../../constant/app_strings.dart';
import '../../../data/model/user.dart';
import '../../../data/remote/api_response.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc({required this.userRepository}):super(
      HomeState(apiResponse: ApiResponse.initial(AppStrings.initializing))
  ){
    on<GetUsersListEvent>(getUsersListEvent);
  }
  final UserRepository userRepository;
  Future<void> getUsersListEvent(GetUsersListEvent event, Emitter<HomeState> emit) async {
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