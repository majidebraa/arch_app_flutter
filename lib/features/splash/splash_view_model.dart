import 'package:flutter/cupertino.dart';
import '../../data/local/local_data.dart';
import '../../data/repository/user_repository.dart';

class SplashViewModel with ChangeNotifier{
  final UserRepository userRepository;
  final LocalData localData;

  SplashViewModel({required this.userRepository, required this.localData});
}