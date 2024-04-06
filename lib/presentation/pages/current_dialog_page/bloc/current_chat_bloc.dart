
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'current_chat_event.dart';
part 'current_chat_state.dart';

class CurrentChatBloc extends Bloc<CurrentChatEvent, CurrentChatState> {
  CurrentChatBloc() : super(CurrentChatInitial()) {
    on<CurrentChatEvent>((event, emit)async {
      await eventHandler(event, emit);
    });
  }

  eventHandler(CurrentChatEvent event,Emitter<CurrentChatState> emit)async{
    // emit(CurrentChatIsLoading());
    // if(event is InitialDataFetchingEvent){
    //     try{
    //          final isChatExists = await DialogsRepo.checkIfDialogExists(event.userId);
    //          log(isChatExists.toString());
    //          if(isChatExists != "0"){
    //              log("чат существует, отправлен запрос на получение сообщений");
    //            // todo запрос на чаты
    //              DialogsRepo.fetchDialogWithUser(isChatExists);
    //          }
    //          else{
    //            log("чата с данным пользователем не существует");
    //            // final newChatId = await DialogsRepo.createNewChat(event.userId);
    //            // log(newChatId);
    //          }
    //     }
    //     catch(e){
    //       log(e.toString());
    //     }
    // }
  }
}
