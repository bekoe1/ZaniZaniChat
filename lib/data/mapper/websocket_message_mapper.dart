import 'package:bloc_test_app/data/dto/websocket_message_dto.dart';
import 'package:bloc_test_app/domain/websocket_message_model.dart';

extension MessageDtoToModel on MessageFromWebSocketDto{
  MessageFromWebSocketModel toModel(){
    return MessageFromWebSocketModel(
      time:  time,
      type: type,
      code:  code,
      messageInfo: messageInfo.toModel(),
    );
  }
}

extension MessageInfoDtoToModel on MessageInfoDto{
  MessageFromWebSocketInfoModel toModel(){
    return MessageFromWebSocketInfoModel(
      fromWho: fromWho,
      chatId: chatId,
      typeOfMessage: typeOfMessage,
      messageData: messageData,
      messageId: messageId,
    );
  }
}