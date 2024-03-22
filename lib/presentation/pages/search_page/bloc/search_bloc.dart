import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/repo/search_repo.dart';
import 'package:bloc_test_app/domain/paginated_searched_account_model.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async{
      await eventHandler(event, emit);
    });
  }

  eventHandler(SearchEvent event, Emitter<SearchState> emit) async{
    if(event is FetchProfiles) {
      try {
        final response = await SearchRepo.searchAccounts(event.name.toString());
        log(response!.results.toString());
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
