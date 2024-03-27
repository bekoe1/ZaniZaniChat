part of 'current_chat_bloc.dart';

@immutable
abstract class CurrentChatEvent {}

class InitialDataFetchingEvent extends CurrentChatEvent{
  final String userId;

  InitialDataFetchingEvent({required this.userId});
}
