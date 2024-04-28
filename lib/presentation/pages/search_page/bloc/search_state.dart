part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  final List<SearchedAccount>? accounts;

  const SearchState({this.accounts});
}

class SearchInitial extends SearchState {
  const SearchInitial({super.accounts});
}

class EmptySearchState extends SearchState {
  EmptySearchState({super.accounts});
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
