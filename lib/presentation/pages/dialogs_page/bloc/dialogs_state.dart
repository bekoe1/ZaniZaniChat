part of 'dialogs_bloc.dart';

@immutable
abstract class DialogsState {
  final List<DialogsModel>? dialogs;
  DialogsState({this.dialogs});
}

class DialogsInitial extends DialogsState {}

class FetchedDialogsState extends DialogsState{
  final List<DialogsModel> dialogs;
  FetchedDialogsState({required this.dialogs}):super(dialogs: dialogs);
}

class ErrorInFetchingDialogsState extends DialogsState{
  final String? exception;

  ErrorInFetchingDialogsState(this.exception);
}