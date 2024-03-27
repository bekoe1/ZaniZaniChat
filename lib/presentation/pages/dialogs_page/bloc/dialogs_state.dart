part of 'dialogs_bloc.dart';

@immutable
abstract class DialogsState {
  final List<DialogDataModel>? dialogs;
  final String? chatId;
  DialogsState({this.chatId,this.dialogs});
}

class DialogsInitial extends DialogsState {}

class FetchedDialogsState extends DialogsState {
  final List<DialogDataModel> dialogs;

  FetchedDialogsState({required this.dialogs}) : super(dialogs: dialogs);
}
class CanOpenChatState extends DialogsState{
  final String chatId;

  CanOpenChatState({required this.chatId}): super(chatId: chatId);
}

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
