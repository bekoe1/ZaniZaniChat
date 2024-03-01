part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent {}

class LoginUsernameChanged extends LogInEvent{
    final String username;
    LoginUsernameChanged({required this.username});
}

class LoginPasswordChanged extends LogInEvent{
  final String password;
  LoginPasswordChanged({required this.password});
}

class LoginDone extends LogInEvent{}