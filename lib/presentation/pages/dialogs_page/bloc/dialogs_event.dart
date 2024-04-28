part of 'dialogs_bloc.dart';

@immutable
abstract class DialogsEvent {}

class FetchDialogsEvent extends DialogsEvent {
  final int page;

  FetchDialogsEvent({required this.page});
}

class DeleteDialogEvent extends DialogsEvent {
  final String chatId;
  final bool deleteForBoth;

  DeleteDialogEvent({
    required this.chatId,
    required this.deleteForBoth,
  });
}

class NoDialogsEvent extends DialogsEvent {}

