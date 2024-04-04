class MessageFromWebSocketModel {
  final String? type;
  final dynamic code;
  final DateTime time;
  final MessageFromWebSocketInfoModel? messageInfo;

  MessageFromWebSocketModel({
    this.type,
    this.code,
    required this.time,
    this.messageInfo,
  });

  MessageFromWebSocketModel copyWith({
    String? type,
    dynamic code,
    DateTime? time,
    MessageFromWebSocketInfoModel? messageInfo,
  }) =>
      MessageFromWebSocketModel(
        type: type ?? this.type,
        code: code ?? this.code,
        time: time ?? this.time,
        messageInfo: messageInfo ?? this.messageInfo,
      );
}

class MessageFromWebSocketInfoModel {
  final String fromWho;
  final String chatId;
  final String typeOfMessage;
  final String messageData;
  final String messageId;

  MessageFromWebSocketInfoModel({
    required this.fromWho,
    required this.chatId,
    required this.typeOfMessage,
    required this.messageData,
    required this.messageId,
  });

  MessageFromWebSocketInfoModel copyWith({
    String? fromWho,
    String? chatId,
    String? typeOfMessage,
    String? messageData,
    String? messageId,
  }) =>
      MessageFromWebSocketInfoModel(
        fromWho: fromWho ?? this.fromWho,
        chatId: chatId ?? this.chatId,
        typeOfMessage: typeOfMessage ?? this.typeOfMessage,
        messageData: messageData ?? this.messageData,
        messageId: messageId ?? this.messageId,
      );
}
