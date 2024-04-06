part of 'my_account_bloc.dart';

@immutable
abstract class MyAccountState {
  final MyAccountInfoData? data;

  MyAccountState({required this.data});
}

class MyAccountInitial extends MyAccountState {
  MyAccountInitial({required super.data});
}

class MyAccDataFetched extends MyAccountState {
  final MyAccountInfoData? data;

  MyAccDataFetched({required this.data}) : super(data: data);
}

class ErrorInFetchingMyAccData extends MyAccountState {
  final String exc;

  ErrorInFetchingMyAccData({required super.data, required this.exc});
}
