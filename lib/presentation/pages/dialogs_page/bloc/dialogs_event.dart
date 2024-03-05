part of 'dialogs_bloc.dart';

@immutable
abstract class DialogsEvent {}

class FetchDialogsEvent extends DialogsEvent {}

class ConnectToServerEvent extends DialogsEvent {
  final BuildContext context;

  ConnectToServerEvent(this.context);
}
