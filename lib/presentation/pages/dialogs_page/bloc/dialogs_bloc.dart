import 'dart:async';

import 'package:bloc/bloc.dart';
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

  eventHandler(DialogsEvent event, Emitter<DialogsState> emit){
    //todo
  }
}
