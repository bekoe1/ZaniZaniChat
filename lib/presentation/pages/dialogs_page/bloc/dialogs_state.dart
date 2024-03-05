part of 'dialogs_bloc.dart';

@immutable
abstract class DialogsState {
  final List<String/*DialogModel*/>? dialogs;
  DialogsState({this.dialogs});
}

class DialogsInitial extends DialogsState {}

class FetchedDialogsState extends DialogsState{
  final List<String/*DialogModel*/> dialogs;
  FetchedDialogsState({required this.dialogs}):super(dialogs: dialogs);
}