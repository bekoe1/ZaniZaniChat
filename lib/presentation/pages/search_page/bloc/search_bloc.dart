import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/domain/models/paginated_accounts_from_search.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../data/datasources/search_data_source.dart';


part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async{
      await eventHandler(event, emit);
    });
  }
  final SearchDataSource dataSource = SearchDataSource();
  eventHandler(SearchEvent event, Emitter<SearchState> emit) async{
    if(event is FetchProfiles) {
      try {
        final response = await dataSource.searchAccounts(event.name.toString());
        emit(SearchedAccountFoundState(accounts: response));
      }
      catch(e){
        emit(SearchErrorState(e: e.toString()));
      }
    }
    if(event is TryToFetchEmptyText){
      emit(EmptySearchState(accounts: null));
    }
  }
}
