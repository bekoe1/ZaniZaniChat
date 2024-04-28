import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/datasources/dialogs_data_source.dart';
import 'package:bloc_test_app/domain/models/message_dto.dart';
import 'package:bloc_test_app/domain/repo/web_socket_repo.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:meta/meta.dart';

import '../../../../domain/models/incoming_message_dto.dart';
import '../../../../domain/models/ws_message_model.dart';

part 'current_chat_event.dart';

part 'current_chat_state.dart';

class CurrentChatBloc extends Bloc<CurrentChatEvent, CurrentChatState> {
  CurrentChatBloc() : super(CurrentChatIsLoading()) {
    on<CurrentChatEvent>((event, emit) async {
      await eventHandler(event, emit);
    });
  }

  final DialogsDataSource dataSource = DialogsDataSource();
  final wsRepo = WebSocketRepo();
  // late final chatId;

  eventHandler(CurrentChatEvent event, Emitter<CurrentChatState> emit) async {
    final myId = await SharedPrefsHelper.getId();
    if (event is CurrentChatDataFetchingEvent) {
      if (event.chatId != null) {
        // chatId = event.chatId;
        try {
          final messages = await dataSource.fetchDialogWithUser(
              chatId: event.chatId??"", page: event.page!);
          emit(CurrentChatFound(
            messages: messages,
            chatId: event.chatId!,
            myId: myId!,
          ));
        } catch (e) {
          log(e.toString());
        }
      } else if (event.userId != null) {
        try {
          final newChatId = await dataSource.checkIfDialogExists(event.userId!);
          // chatId = newChatId;
          if (newChatId != "0") {
            final messages = await dataSource.fetchDialogWithUser(
                chatId: newChatId, page: event.page!);
            // emit(CurrentChatFound(chatId: newChatId));
          } else {
            log("NEty Chataaaaaaaaaa");
            emit(CurrentChatDoesNotExist());
          }
        } catch (e) {
          log(e.toString());
        }
      } else {
        log("pusto");
      }
    }
    //проверить после реализации создания чата
    if (event is MessageSendEvent) {
      if (state.chatId != null) {
        final message = MessageDto(
          id: '',
          sender: myId!,
          data: event.message,
          time: DateTime.now(),
          type: "text",
          read: false,
          edited: false,
        );
        final messageToWs = WsMessage(
          chatId: state.chatId!,
          type: "text",
          data: event.message,
        );
        try {
          wsRepo.send(messageToWs);
          emit(
            CurrentChatFound(
              myId: myId,
              chatId: state.chatId!,
              messages: List.from(state.messages)..add(message),
            ),
          );
        } catch (e) {
          log(e.toString());
        }
      } else if (state.chatId == null && event.userId != null) {
        final newChatId = await dataSource.createNewChat(event.userId!);
        final message = MessageDto(
          id: '',
          sender: myId!,
          data: event.message,
          time: DateTime.now(),
          type: "text",
          read: false,
          edited: false,
        );
        final messageToWs = WsMessage(
          chatId: newChatId,
          type: "text",
          data: event.message,
        );
        try {
          wsRepo.send(messageToWs);
          emit(
            CurrentChatFound(
              myId: myId,
              chatId: newChatId,
              messages: List.from(state.messages)..add(message),
            ),
          );
        } catch (e) {
          log(e.toString());
        }
      }
    }
  }
}
