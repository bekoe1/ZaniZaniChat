part of 'current_chat_bloc.dart';

@immutable
abstract class CurrentChatEvent {
  final String? userId;
  final int? page;

  CurrentChatEvent({
    this.userId,
    this.page,
  });
}

class CurrentChatDataFetchingEvent extends CurrentChatEvent {
  final String? userId;
  final int? page;
  final String? chatId;
  CurrentChatDataFetchingEvent({
    this.userId,
    this.page,
    this.chatId,
  }) : super(userId: userId, page: page);
}

class MessageSendEvent extends CurrentChatEvent {
  final String message;
  //заменить MessageDto на текст/и тд
  MessageSendEvent({
    required this.message,
  });
}

class MessageReceivedEvent extends CurrentChatEvent {
  final MessageDto message;

  MessageReceivedEvent({
    required this.message,
  });
}

class MessageDeleteEvent extends CurrentChatEvent {
  final int number;
  final String chatId;

  MessageDeleteEvent({
    required this.number,
    required this.chatId,
  });
}
