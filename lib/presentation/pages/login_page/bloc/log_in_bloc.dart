
import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/repo/auth_repo.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:meta/meta.dart';
import '../../../../utils/form_submission_status.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final AuthRepository? repo;

  LogInBloc({this.repo}) : super(const LogInState()) {
    on<LogInEvent>((event, emit) async {
      await eventHandler(event, emit);
    });
  }

  eventHandler(LogInEvent event, Emitter<LogInState> emit) async {
    emit(state.copyWith(status: FormSubmitting()));
    final response;
    if (event is LoginPasswordChanged) {
      emit(state.copyWith(
          password: event.password, status: SubmissionSuccess()));
    } else if (event is LoginUsernameChanged) {
      emit(state.copyWith(
          username: event.username, status: SubmissionSuccess()));
    } else if (event is LoginDone) {
      emit(state.copyWith(status: FormSubmitting()));
      try {
        response =
            await AuthRepository.LogInData(state.username, state.password);
        if (response != null) {
          SharedPrefsHelper.SetSessionToken(response.toString());
        } else {
          throw "Сервер не вернул токен";
        }
        emit(state.copyWith(status: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(status: SubmissionFailed(exc: e)));
      }
    }
  }
}
