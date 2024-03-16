part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  final PaginatedSearchedAccountsModel? accounts;

  SearchState({this.accounts});
}

class SearchInitial extends SearchState {
  SearchInitial({super.accounts});
}

class SearchedAccountFoundState extends SearchState {
  SearchedAccountFoundState({super.accounts});
}

class SearchedAccountNotFoundState extends SearchState {
  SearchedAccountNotFoundState({super.accounts});
}

class SearchErrorState extends SearchState {
  final String e;

  SearchErrorState({required this.e, super.accounts});
}
