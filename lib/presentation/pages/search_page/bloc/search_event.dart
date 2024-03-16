part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class FetchProfiles extends SearchEvent {
  final String? name;

  FetchProfiles({required this.name});
}



