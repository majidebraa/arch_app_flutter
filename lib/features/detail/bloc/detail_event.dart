part of 'detail_bloc.dart';
abstract class DetailEvent{
  const DetailEvent();

}

class GetUserDetailEvent extends DetailEvent{
  final String login;
  const GetUserDetailEvent({required this.login});

}