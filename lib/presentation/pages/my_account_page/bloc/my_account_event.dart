part of 'my_account_bloc.dart';

@immutable
abstract class MyAccountEvent {}

class FetchAccountInfoEvent extends MyAccountEvent {}

class AttemptToChangeNameAndSurname extends MyAccountEvent{
  final String name;
  final String surname;

  AttemptToChangeNameAndSurname({required this.name, required this.surname});

}

class AttemptToChangeUserName extends MyAccountEvent{
  final String username;

  AttemptToChangeUserName({required this.username});
}

