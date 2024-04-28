import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/datasources/dialogs_data_source.dart';
import 'package:bloc_test_app/data/datasources/my_account_info_data_source.dart';
import 'package:bloc_test_app/domain/models/dialogs.dart';
import 'package:bloc_test_app/domain/repo/web_socket_repo.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
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

  final DialogsDataSource dialogsDataSource = DialogsDataSource();
  final MyAccountDataSource myAccountDataSource = MyAccountDataSource();

  eventHandler(DialogsEvent event, Emitter<DialogsState> emit) async {
    if (event is FetchDialogsEvent) {
      try {
        //todo number of pages check
        if (WebSocketRepo.channel == null) {
          WebSocketRepo().connect();
        }
        final response = await dialogsDataSource.getDialogs(event.page);
        log(event.page.toString());
        final accountInfo = await myAccountDataSource.getData();
        SharedPrefsHelper.setID(accountInfo!.id);
        if (response != null && response.data.isNotEmpty) {
          emit(
            FetchedDialogsState(
              dialogs: sortDialogs(response.data),
              myId: accountInfo.id,
            ),
          );
        } else if (response != null && response.data.isEmpty) {
          emit(NoDialogsState());
        } else {
          emit(ErrorInFetchingDialogsState("Ошибка загрузки"));
        }
      } catch (e) {
        if (e.toString() == "Ошибка загрузки") {
          emit(NoDialogsState());
        } else {
          emit(ErrorInFetchingDialogsState(e.toString()));
        }
      }
    }
    if (event is DeleteDialogEvent) {
      try {
        final response = await dialogsDataSource.deleteDialog(
            event.chatId, event.deleteForBoth);
        emit(DeletingDone());
      } catch (e) {
        emit(ErrorInFetchingDialogsState(e.toString()));
      }
    }
  }

  List<DialogsData> sortDialogs(List<DialogsData> dialogs) {
    return dialogs.reversed.toList()
      ..sort(
        (a, b) {
          if (a.lastMessage.data != "" && b.lastMessage.data != "") {
            return a.lastMessage.time.compareTo(b.lastMessage.time);
          } else {
            return a.lastMessage.data == "" ? -1 : 1;
          }
        },
      );
  }
}
