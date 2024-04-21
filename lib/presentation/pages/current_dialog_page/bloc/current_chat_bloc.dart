import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/datasources/dialogs_data_source.dart';
import 'package:meta/meta.dart';

part 'current_chat_event.dart';

part 'current_chat_state.dart';

class CurrentChatBloc extends Bloc<CurrentChatEvent, CurrentChatState> {
  CurrentChatBloc() : super(CurrentChatInitial()) {
    on<CurrentChatEvent>((event, emit) async {
      await eventHandler(event, emit);
    });
  }
  final DialogsDataSource dataSource = DialogsDataSource();

  eventHandler(CurrentChatEvent event, Emitter<CurrentChatState> emit) async {
    if (event is CurrentChatInitial) {
      if (event.chatId != null) {
        try {
          dataSource.fetchDialogWithUser(event.chatId!);
        } catch (e) {
          log(e.toString());
        }
      }
    }
  }
}
