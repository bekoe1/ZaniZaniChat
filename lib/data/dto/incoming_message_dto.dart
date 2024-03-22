import 'package:json_annotation/json_annotation.dart';
part 'incoming_message_dto.g.dart';
@JsonSerializable()
class IncomingMessageDto {
  @JsonKey(name: "type_")
  final String? type;
  @JsonKey(name: "code")
  final dynamic code;
  @JsonKey(name: "time")
  final DateTime? time;
  @JsonKey(name: "message_info")
  final MessageInfoDto? messageInfo;

  IncomingMessageDto({
    this.type,
    this.code,
    this.time,
    this.messageInfo,
  });

  IncomingMessageDto copyWith({
    String? type,
    dynamic code,
    DateTime? time,
    MessageInfoDto? messageInfo,
  }) =>
      IncomingMessageDto(
        type: type ?? this.type,
        code: code ?? this.code,
        time: time ?? this.time,
        messageInfo: messageInfo ?? this.messageInfo,
      );

  factory IncomingMessageDto.fromJson(Map<String, dynamic> json) => _$IncomingMessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IncomingMessageDtoToJson(this);
}

@JsonSerializable()
class MessageInfoDto {
  @JsonKey(name: "from_who")
  final String? fromWho;
  @JsonKey(name: "chat_id")
  final String? chatId;
  @JsonKey(name: "type_of_message")
  final String? typeOfMessage;
  @JsonKey(name: "message_data")
  final String? messageData;
  @JsonKey(name: "message_id")
  final String? messageId;

  MessageInfoDto({
    this.fromWho,
    this.chatId,
    this.typeOfMessage,
    this.messageData,
    this.messageId,
  });

  MessageInfoDto copyWith({
    String? fromWho,
    String? chatId,
    String? typeOfMessage,
    String? messageData,
    String? messageId,
  }) =>
      MessageInfoDto(
        fromWho: fromWho ?? this.fromWho,
        chatId: chatId ?? this.chatId,
        typeOfMessage: typeOfMessage ?? this.typeOfMessage,
        messageData: messageData ?? this.messageData,
        messageId: messageId ?? this.messageId,
      );

  factory MessageInfoDto.fromJson(Map<String, dynamic> json) => _$MessageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageInfoToJson(this);
}
