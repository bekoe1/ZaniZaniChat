part of 'dialogs_bloc.dart';

@immutable
abstract class DialogsState {
  final List<DialogsData>? dialogs;
  final String? chatId;
  final String? myId;

  DialogsState({
    this.chatId,
    this.dialogs,
    this.myId,
  });
}

class DialogsInitial extends DialogsState {}

class FetchedDialogsState extends DialogsState {
  final List<DialogsData> dialogs;
  final String myId;

  FetchedDialogsState({
    required this.dialogs,
    required this.myId,
  }) : super(dialogs: dialogs);
}

//

class ErrorInFetchingDialogsState extends DialogsState {
  final String? exception;

  ErrorInFetchingDialogsState(this.exception);
}

class NoDialogsState extends DialogsState {}

class ErrorInDeletingMessage extends DialogsState {
  final String? exception;

  ErrorInDeletingMessage({super.dialogs, required this.exception});
}

class DeletingDone extends DialogsState {}
