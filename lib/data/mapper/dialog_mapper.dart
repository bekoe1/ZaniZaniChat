import 'package:bloc_test_app/data/dto/dialogs_dto.dart';
import 'package:bloc_test_app/domain/dialog_model.dart';

extension DialogDtoToModel on DialogDto{
    DialogModel toModel(){
      return DialogModel(chatId: chatId, dialogsDtoWith: dialogsDtoWith.toModel(), id: id, sender: sender, message: message, time: time, type: type, read: read, profilePic: profilePic);
    }
}

extension WithDtoToModel on WithDto{
  WithModel toModel(){
    return WithModel(username: username, id: id);
  }
}