import 'package:bloc_test_app/data/dto/incoming_message_dto.dart';
import 'package:bloc_test_app/domain/message_model.dart';

extension MessageDtoToModel on IncomingMessageDto{
  MessageModel toModel(){
    return MessageModel(
      time:  time,
      type: type,
      code:  code,
      messageInfo: messageInfo!.toModel(),
    );
  }
}

extension MessageInfoDtoToModel on MessageInfoDto{
  MessageInfoModel toModel(){
    return MessageInfoModel(
      fromWho: fromWho,
      chatId: chatId,
      typeOfMessage: typeOfMessage,
      messageData: messageData,
      messageId: messageId,
    );
  }
}