import 'package:json_annotation/json_annotation.dart';
part 'websocket_message_dto.g.dart';
@JsonSerializable()
class MessageFromWebSocketDto {
  @JsonKey(name: "type_")
  final String type;
  @JsonKey(name: "code")
  final dynamic code;
  @JsonKey(name: "time")
  final DateTime time;
  @JsonKey(name: "message_info")
  final MessageInfoDto messageInfo;

  MessageFromWebSocketDto({
    required this.type,
    required this.code,
    required this.time,
    required this.messageInfo,
  });

  MessageFromWebSocketDto copyWith({
    String? type,
    dynamic code,
    DateTime? time,
    MessageInfoDto? messageInfo,
  }) =>
      MessageFromWebSocketDto(
        type: type ?? this.type,
        code: code ?? this.code,
        time: time ?? this.time,
        messageInfo: messageInfo ?? this.messageInfo,
      );

  factory MessageFromWebSocketDto.fromJson(Map<String, dynamic> json) => _$MessageFromWebSocketDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageFromWebSocketDtoToJson(this);
}

@JsonSerializable()
class MessageInfoDto {
  @JsonKey(name: "from_who")
  final String fromWho;
  @JsonKey(name: "chat_id")
  final String chatId;
  @JsonKey(name: "type_of_message")
  final String typeOfMessage;
  @JsonKey(name: "message_data")
  final String messageData;
  @JsonKey(name: "message_id")
  final String messageId;

  MessageInfoDto({
    required this.fromWho,
    required this.chatId,
    required this.typeOfMessage,
    required this.messageData,
    required this.messageId,
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

  factory MessageInfoDto.fromJson(Map<String, dynamic> json) => _$MessageInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageInfoDtoToJson(this);
}
