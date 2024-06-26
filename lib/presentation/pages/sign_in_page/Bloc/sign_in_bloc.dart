import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/datasources/auth_data_source.dart';
import 'package:bloc_test_app/utils/form_submission_status.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthDataSource authDataSource;

  SignInBloc({required this.authDataSource}) : super(SignInState()) {
    on<SignInEvent>((event, emit) async {
      await eventHandler(event, emit);
    });
  }

  eventHandler(SignInEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: FormSubmitting()));
    if (event is SignInPasswordChanged) {
      emit(state.copyWith(pass: event.password, status: SubmissionSuccess()));
    }
    if (event is SignInEmailChanged) {
      emit(state.copyWith(email: event.email, status: SubmissionSuccess()));
    }
    if (event is SignInUsernameChanged) {
      emit(state.copyWith(name: event.name, status: SubmissionSuccess()));
    } else if (event is SignInDone) {
      emit(state.copyWith(status: FormSubmitting()));
      final response;
      try {
        response = await authDataSource.signIn(
          name: state.username,
          email: state.email,
          pass: state.password,
        );
        if (response) {
          emit(state.copyWith(status: SubmissionSuccess()));
        } else {
          emit(state.copyWith(
              status: SubmissionFailed(exc: "Произошла ошибка")));
        }
      } catch (e) {
        emit(state.copyWith(status: SubmissionFailed(exc: e.toString())));
      }
    }
  }
}
