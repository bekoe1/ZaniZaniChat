import 'package:bloc_test_app/data/dto/dialogs_dto.dart';
import 'package:bloc_test_app/domain/dialog_model.dart';

extension DialogDtoToModel on DialogsDto {
  DialogsModel toModel() {
    return DialogsModel(
        message: message, data: data.map((e) => (e.toModel())).toList());
  }
}

extension DialogsDataDtoToModel on Datum {
  DialogDataModel toModel() {
    return DialogDataModel(
        id: id,
        type: type,
        picture: picture,
        name: name,
        lastMessage: lastMessage != null ? lastMessage!.toModel() : null);
  }
}

extension LastMessageInDialogDtoToModel on LastMessage {
  LastMessageModel toModel() {
    return LastMessageModel(k: k, v: v.toModel());
  }
}

extension MessageValueToModel on MessageValueDto {
  MessageValueModel toModel() {
    return MessageValueModel(
      sender: sender,
      data: data,
      time: time,
      type: type,
      read: read,
      edited: edited,
    );
  }
}
