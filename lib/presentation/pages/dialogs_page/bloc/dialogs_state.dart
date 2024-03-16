part of 'dialogs_bloc.dart';

@immutable
abstract class DialogsState {
  final PaginatedDialogsModel? dialogs;

  DialogsState({this.dialogs});
}

class DialogsInitial extends DialogsState {}

class FetchedDialogsState extends DialogsState {
  final PaginatedDialogsModel dialogs;

  FetchedDialogsState({required this.dialogs}) : super(dialogs: dialogs);
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
