import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      eventHandler(event, emit);
    });
  }

  eventHandler(SettingsEvent event, Emitter<SettingsState> emit) {
    if(event is SettingsLogOutEvent){
      AuthRepository.logOut();
    }
  }
}
