part of 'log_in_bloc.dart';

@immutable
class LogInState {
  final String username;
  final String password;
  final FormSubmissionStatus status;
  const LogInState({this.username = '', this.password = '', this.status = const InitialFormStatus()});

  LogInState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? status,
  }) {
    return LogInState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password);
  }
}

class LogInSubmitted extends LogInState {
  final String username;
  final String password;

  LogInSubmitted({required this.password, required this.username})
      : super(password: password, username: username);
}
