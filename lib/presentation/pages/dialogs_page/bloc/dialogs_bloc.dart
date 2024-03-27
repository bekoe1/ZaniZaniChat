import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/repo/dialogs_repo.dart';
import 'package:bloc_test_app/domain/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dialogs_event.dart';

part 'dialogs_state.dart';

class DialogsBloc extends Bloc<DialogsEvent, DialogsState> {
  DialogsBloc() : super(DialogsInitial()) {
    on<DialogsEvent>((event, emit) async {
      await eventHandler(event, emit);
    });
  }

  eventHandler(DialogsEvent event, Emitter<DialogsState> emit) async {
    if(event is OpenedChatEvent){
      //todo id check logic
      emit(CanOpenChatState(chatId: event.chatId));
    }
    if (event is FetchDialogsEvent) {
      try {
        //todo number of pages check
        final response = await DialogsRepo.getDialogs(event.page);
        if (response != null) {
          emit(FetchedDialogsState(
            dialogs: response.data.reversed.toList()
              ..toList().sort(
                (a, b) {
                  if (a.lastMessage != null && b.lastMessage != null) {
                    return a.lastMessage!.v.time
                        .compareTo(b.lastMessage!.v.time);
                  } else if (a.lastMessage == null && b.lastMessage == null) {
                    return a.name.compareTo(b.name);
                  } else {
                    return a.lastMessage == null ? -1 : 1;
                  }
                },
              ),
          ));
        } else if (response == null) {
          emit(NoDialogsState());
        }
      } catch (e) {
        if (e.toString() == "No such chatc error") {
          emit(NoDialogsState());
        } else {
          emit(ErrorInFetchingDialogsState(e.toString()));
        }
      }
    }
    if (event is DeleteMessageEvent) {
      try {
        final response = await DialogsRepo.deleteDialog(event.chatId);
        emit(DeletingDone());
      } catch (e) {
        emit(ErrorInFetchingDialogsState(e.toString()));
      }
    }
  }
}
