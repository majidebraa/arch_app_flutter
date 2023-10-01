import 'package:rounded_loading_button/rounded_loading_button.dart';

extension RoundedLoadingButtonExtension on RoundedLoadingButtonController{
  Future<void> btnSuccess() async {
    success();
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  Future<void> btnError() async {
    error();
    await Future.delayed(const Duration(milliseconds: 1000));
    reset();
  }
}