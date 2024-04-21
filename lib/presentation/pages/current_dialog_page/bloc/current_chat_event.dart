part of 'current_chat_bloc.dart';

@immutable
abstract class CurrentChatEvent {
  final String? userId;
  final String? chatId;

  CurrentChatEvent({this.userId, this.chatId});
}

class InitialDataFetchingEvent extends CurrentChatEvent {
  final String? userId;
  final String? chatId;

  InitialDataFetchingEvent({this.chatId, this.userId})
      : super(chatId: chatId, userId: userId);
}
