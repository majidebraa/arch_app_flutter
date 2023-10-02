import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../data/local/local_data.dart';
import '../../data/repository/user_repository.dart';

class SplashViewModel extends GetxController{
  final UserRepository userRepository;
  final LocalData localData;

  SplashViewModel({required this.userRepository, required this.localData});
}