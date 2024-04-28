import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.g.dart';
@JsonSerializable()
class MessageDto {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "sender")
  final String sender;
  @JsonKey(name: "data")
  final String data;
  @JsonKey(name: "time")
  final DateTime time;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "read")
  final bool read;
  @JsonKey(name: "edited")
  final bool edited;

  MessageDto({
    required this.id,
    required this.sender,
    required this.data,
    required this.time,
    required this.type,
    required this.read,
    required this.edited,
  });

  MessageDto copyWith({
    String? id,
    String? sender,
    String? data,
    DateTime? time,
    String? type,
    bool? read,
    bool? edited,
  }) =>
      MessageDto(
        id: id ?? this.id,
        sender: sender ?? this.sender,
        data: data ?? this.data,
        time: time ?? this.time,
        type: type ?? this.type,
        read: read ?? this.read,
        edited: edited ?? this.edited,
      );

  factory MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);
}
