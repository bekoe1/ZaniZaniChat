import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/repo/dialogs_repo.dart';
import 'package:bloc_test_app/domain/all_dialogs_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dialogs_event.dart';
part 'dialogs_state.dart';

class DialogsBloc extends Bloc<DialogsEvent, DialogsState> {
  DialogsBloc() : super(DialogsInitial()) {
    on<DialogsEvent>((event, emit) async{
      await eventHandler(event, emit);
    });
  }

  eventHandler(DialogsEvent event, Emitter<DialogsState> emit)async{
    if(event is FetchDialogsEvent){
      try{
        final response = await DialogsRepo.GetDialogs(event.page);
      }
      catch(e){
        emit(ErrorInFetchingDialogsState(e.toString()));
      }
    }
  }
}
