part of 'dialogs_bloc.dart';

@immutable
abstract class DialogsEvent {}

class FetchDialogsEvent extends DialogsEvent {
  final int page;

  FetchDialogsEvent(this.page);
}

class DeleteMessageEvent extends DialogsEvent {
  final String chatId;

  DeleteMessageEvent({required this.chatId});
}

class NoDialogsEvent extends DialogsEvent {}
