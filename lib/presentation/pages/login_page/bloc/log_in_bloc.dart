
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/datasources/auth_data_source.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:meta/meta.dart';
import '../../../../data/datasources/my_account_info_data_source.dart';
import '../../../../domain/repo/web_socket_repo.dart';
import '../../../../utils/form_submission_status.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final AuthDataSource authDataSource;
  final MyAccountDataSource myAccountDataSource = MyAccountDataSource();
  LogInBloc({required this.authDataSource}) : super(const LogInState()) {
    on<LogInEvent>((event, emit) async {
      await eventHandler(event, emit);
    });
  }

  eventHandler(LogInEvent event, Emitter<LogInState> emit) async {
    emit(state.copyWith(status: FormSubmitting()));
    final response;
    if (event is LoginPasswordChanged) {
      emit(state.copyWith(
          password: event.password, status: FormDataEdited()));
    } else if (event is LoginUsernameChanged) {
      emit(state.copyWith(
          username: event.username, status: FormDataEdited()));
    } else if (event is LoginDone) {
      emit(state.copyWith(status: FormSubmitting()));
      try {
        response =
            await authDataSource.logIn(username: state.username,password: state.password);
        if (response != null) {
           SharedPrefsHelper.setSessionToken(response);
           final userData = await myAccountDataSource.getData();
           if(userData != null) {
             SharedPrefsHelper.setName(userData.username);
           }
           SharedPrefsHelper.setName(state.username);
           WebSocketRepo().connect();
          emit(state.copyWith(status: SubmissionSuccess()));
        } else {
          emit(state.copyWith(status: SubmissionFailed(exc: "Сервер не вернул токен")));
          throw "Сервер не вернул токен";
        }
      } catch (e) {
        emit(state.copyWith(status: SubmissionFailed(exc: e.toString())));
        log(state.status.toString());
      }
    }
  }
}
