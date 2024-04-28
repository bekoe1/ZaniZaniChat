import 'package:freezed_annotation/freezed_annotation.dart';
part 'ws_message_model.g.dart';
@JsonSerializable()
class WsMessage {
  @JsonKey(name: "chat_id")
  final String chatId;
  @JsonKey(name: "type_")
  final String type;
  @JsonKey(name: "data")
  final String data;

  WsMessage({
    required this.chatId,
    required this.type,
    required this.data,
  });

  WsMessage copyWith({
    String? chatId,
    String? type,
    String? data,
  }) =>
      WsMessage(
        chatId: chatId ?? this.chatId,
        type: type ?? this.type,
        data: data ?? this.data,
      );

  factory WsMessage.fromJson(Map<String, dynamic> json) => _$WsMessageFromJson(json);

  Map<String, dynamic> toJson() => _$WsMessageToJson(this);
}
