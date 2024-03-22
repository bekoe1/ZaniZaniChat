class MessageModel {
  final String? type;
  final dynamic code;
  final DateTime? time;
  final MessageInfoModel? messageInfo;

  MessageModel({
    this.type,
    this.code,
    this.time,
    this.messageInfo,
  });

  MessageModel copyWith({
    String? type,
    dynamic code,
    DateTime? time,
    MessageInfoModel? messageInfo,
  }) =>
      MessageModel(
        type: type ?? this.type,
        code: code ?? this.code,
        time: time ?? this.time,
        messageInfo: messageInfo ?? this.messageInfo,
      );
}

class MessageInfoModel {
  final String? fromWho;
  final String? chatId;
  final String? typeOfMessage;
  final String? messageData;
  final String? messageId;

  MessageInfoModel({
    this.fromWho,
    this.chatId,
    this.typeOfMessage,
    this.messageData,
    this.messageId,
  });

  MessageInfoModel copyWith({
    String? fromWho,
    String? chatId,
    String? typeOfMessage,
    String? messageData,
    String? messageId,
  }) =>
      MessageInfoModel(
        fromWho: fromWho ?? this.fromWho,
        chatId: chatId ?? this.chatId,
        typeOfMessage: typeOfMessage ?? this.typeOfMessage,
        messageData: messageData ?? this.messageData,
        messageId: messageId ?? this.messageId,
      );
}
