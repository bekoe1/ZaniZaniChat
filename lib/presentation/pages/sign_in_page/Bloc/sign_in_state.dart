part of 'sign_in_bloc.dart';

@immutable
class SignInState {
  final FormSubmissionStatus status;
  final String username;
  final String email;
  final String password;

  SignInState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.status = const InitialFormStatus(),
  });

  SignInState copyWith(
      {String? name,
      String? pass,
      String? email,
      FormSubmissionStatus? status}) {
    return SignInState(
      username: name ?? this.username,
      email: email ?? this.email,
      password: pass ?? this.password,
      status: status ?? this.status,
    );
  }
}

class SignInSubmitted extends SignInState {
  final String username;
  final String email;
  final String password;

  SignInSubmitted({
    required this.password,
    required this.email,
    required this.username,
  }) : super(
          username: username,
          password: password,
          email: email,
        );
}
