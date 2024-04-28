part of 'current_chat_bloc.dart';

@immutable
class CurrentChatState {
  final String? chatId;
  final List<MessageDto> messages = [];
  final String? myId;

  CurrentChatState({
    this.chatId,
    this.myId,
  });
}


class CurrentChatDoesNotExist extends CurrentChatState {}

class CurrentChatIsLoading extends CurrentChatState {}

class CurrentChatFound extends CurrentChatState {
  final String chatId;
  final String myId;
  final List<MessageDto> messages;

  CurrentChatFound({
    required this.myId,
    required this.chatId,
    required this.messages,
  }) : super(
          chatId: chatId,
          myId: myId,
        );
}

class CurrentChatLoadingError extends CurrentChatState {
  final String error;

  CurrentChatLoadingError({super.chatId, required this.error});
}
