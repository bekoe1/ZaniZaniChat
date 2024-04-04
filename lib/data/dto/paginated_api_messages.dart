import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_api_messages.g.dart';
@JsonSerializable()
class PaginatedMessagesFromApi {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final PaginatedMessagesFromApiData? data;

  PaginatedMessagesFromApi({
    this.message,
    this.data,
  });

  PaginatedMessagesFromApi copyWith({
    String? message,
    PaginatedMessagesFromApiData? data,
  }) =>
      PaginatedMessagesFromApi(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PaginatedMessagesFromApi.fromJson(Map<String, dynamic> json) => _$PaginatedMessagesFromApiFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedMessagesFromApiToJson(this);
}

@JsonSerializable()
class PaginatedMessagesFromApiData {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "type_")
  final String? type;
  @JsonKey(name: "participants")
  final List<String>? participants;
  @JsonKey(name: "messages")
  final List<MessageFromApiDto>? messages;

  PaginatedMessagesFromApiData({
    this.id,
    this.type,
    this.participants,
    this.messages,
  });

  PaginatedMessagesFromApiData copyWith({
    String? id,
    String? type,
    List<String>? participants,
    List<MessageFromApiDto>? messages,
  }) =>
      PaginatedMessagesFromApiData(
        id: id ?? this.id,
        type: type ?? this.type,
        participants: participants ?? this.participants,
        messages: messages ?? this.messages,
      );

  factory PaginatedMessagesFromApiData.fromJson(Map<String, dynamic> json) => _$PaginatedMessagesFromApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedMessagesFromApiDataToJson(this);
}

@JsonSerializable()
class MessageFromApiDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "sender")
  final String sender;
  @JsonKey(name: "data")
  final String data;
  @JsonKey(name: "time")
  final DateTime time;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "read")
  final bool? read;
  @JsonKey(name: "edited")
  final bool? edited;

  MessageFromApiDto({
    this.id,
    required this.sender,
    required this.data,
    required this.time,
    this.type,
    this.read,
    this.edited,
  });

  MessageFromApiDto copyWith({
    String? id,
    String? sender,
    String? data,
    DateTime? time,
    String? type,
    bool? read,
    bool? edited,
  }) =>
      MessageFromApiDto(
        id: id ?? this.id,
        sender: sender ?? this.sender,
        data: data ?? this.data,
        time: time ?? this.time,
        type: type ?? this.type,
        read: read ?? this.read,
        edited: edited ?? this.edited,
      );

  factory MessageFromApiDto.fromJson(Map<String, dynamic> json) => _$MessageFromApiDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageFromApiDtoToJson(this);
}
