part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInDone extends SignInEvent{}

class SignInPasswordChanged extends SignInEvent{
  final String password;
  SignInPasswordChanged({required this.password});
}

class SignInUsernameChanged extends SignInEvent{
  final String name;
  SignInUsernameChanged({required this.name});
}

class SignInEmailChanged extends SignInEvent{
  final String email;
  SignInEmailChanged({required this.email});
}