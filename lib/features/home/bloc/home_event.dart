part of 'home_bloc.dart';
abstract class HomeEvent {
  const HomeEvent();
}

class GetUsersListEvent extends HomeEvent{
  const GetUsersListEvent();

}