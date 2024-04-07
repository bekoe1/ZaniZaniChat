import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/data/datasources/my_account_info_data_source.dart';
import 'package:bloc_test_app/domain/models/my_account_info.dart';
import 'package:meta/meta.dart';

part 'my_account_event.dart';

part 'my_account_state.dart';

class MyAccountBloc extends Bloc<MyAccountEvent, MyAccountState> {
  MyAccountBloc() : super(MyAccountInitial(data: null)) {
    on<MyAccountEvent>((event, emit) async {
      await eventHandler(event, emit);
    });
  }

  final MyAccountDataSource dataSource = MyAccountDataSource();

  eventHandler(MyAccountEvent event, Emitter emit) async {
    if (event is FetchAccountInfoEvent) {
      try {
        final data = await dataSource.getData();
        if (data != null) {
          log("fetched ");
          emit(MyAccDataFetched(data: data));
          log(state.toString());
        } else {
          emit(
            ErrorInFetchingMyAccData(
              data: null,
              exc: "Произошла Ошибка",
            ),
          );
        }
      } catch (e) {
        emit(ErrorInFetchingMyAccData(
          data: null,
          exc: e.toString(),
        ));
      }
    }
    if(event is AttemptToChangeNameAndSurname){
      try{
          final response =await dataSource.changeNameAndSurname(event.name, event.surname);
          if(response != "ok"){
            emit(ErrorInFetchingMyAccData(exc: response.toString()));
          }
      }catch(e){
        log(e.toString());
      }
    }
    if(event is AttemptToChangeUserName){
      try{
        final response =await dataSource.changeUsername(event.username);
        if(response != "ok"){
          emit(ErrorInFetchingMyAccData(exc: response.toString()));
        }
      }catch(e){
        log(e.toString());
      }
    }
  }
}
