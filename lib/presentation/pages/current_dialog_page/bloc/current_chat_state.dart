part of 'current_chat_bloc.dart';

@immutable
abstract class CurrentChatState {
  final String? chatId;

  CurrentChatState({this.chatId});
}

class CurrentChatInitial extends CurrentChatState {}

class CurrentChatDoesNotExist extends CurrentChatState {}

class CurrentChatIsLoading extends CurrentChatState {}

class CurrentChatFound extends CurrentChatState {
  final String chatId;

  CurrentChatFound({required this.chatId}) : super(chatId: chatId);
}
