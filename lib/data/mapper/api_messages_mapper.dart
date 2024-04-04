import 'package:bloc_test_app/data/dto/paginated_api_messages.dart';
import 'package:bloc_test_app/data/dto/websocket_message_dto.dart';
import 'package:bloc_test_app/domain/paginated_messages_from_api_model.dart';

extension PaginatedMessagesFromApiDtoToModel on PaginatedMessagesFromApi{
  PaginatedMessagesFromApiModel toModel(){
    return PaginatedMessagesFromApiModel(
      message: message,
      data: data?.toModel(),
    );
  }
}

extension MessagesFromApiDataDtoToModel on PaginatedMessagesFromApiData{
  PaginatedMessagesFromApiDataModel toModel(){
    return PaginatedMessagesFromApiDataModel(
      id: id,
      type: type,
      participants: participants,
      messages: messages!.map((e) => (e.toModel())).toList(),
    );
  }
}

extension MessagesFromApiDtoToModel on MessageFromApiDto{
  MessageFromApiModel toModel(){
    return MessageFromApiModel(
      id: id,
      sender: sender,
      data: data,
      type: type,
      read: read,
      edited: edited, time: time,
    );
  }
}

extension MessageFromWsDtoToApiModel on MessageFromWebSocketDto{
  MessageFromApiModel toModel(){
    return MessageFromApiModel(
      type:  type,
      time:  time,
      id: messageInfo.messageId,
      sender: messageInfo.fromWho!,
      data: messageInfo.messageData,
    );
  }
}