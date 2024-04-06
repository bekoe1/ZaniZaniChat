part of 'my_account_bloc.dart';

@immutable
abstract class MyAccountEvent {}

class FetchAccountInfoEvent extends MyAccountEvent {}

class AttemptToChangeName extends MyAccountEvent{
  final String data;

  AttemptToChangeName({required this.data});
}

class AttemptToChangeSurName extends MyAccountEvent{
  final String data;

  AttemptToChangeSurName({required this.data});
}

class AttemptToChangeUserName extends MyAccountEvent{
  final String data;

  AttemptToChangeUserName({required this.data});
}