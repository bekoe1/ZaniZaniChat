import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'dialogs_dto.g.dart';

@JsonSerializable()
class DialogsDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<Datum>? data;

  DialogsDto({
    this.message,
    this.data,
  });

  DialogsDto copyWith({
    String? message,
    List<Datum>? data,
  }) =>
      DialogsDto(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory DialogsDto.fromJson(Map<String, dynamic> json) => _$DialogsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DialogsDtoToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "last_message")
  final LastMessageDto? lastMessage;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "profile_photo")
  final List<dynamic>? profilePhoto;

  Datum({
    this.id,
    this.lastMessage,
    this.name,
    this.profilePhoto,
  });

  Datum copyWith({
    String? id,
    LastMessageDto? lastMessage,
    String? name,
    List<dynamic>? profilePhoto,
  }) =>
      Datum(
        id: id ?? this.id,
        lastMessage: lastMessage ?? this.lastMessage,
        name: name ?? this.name,
        profilePhoto: profilePhoto ?? this.profilePhoto,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class LastMessageDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "sender")
  final String? sender;
  @JsonKey(name: "data")
  final String? data;
  @JsonKey(name: "time")
  final DateTime? time;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "read")
  final bool? read;
  @JsonKey(name: "edited")
  final bool? edited;

  LastMessageDto({
    this.id,
    this.sender,
    this.data,
    this.time,
    this.type,
    this.read,
    this.edited,
  });

  LastMessageDto copyWith({
    String? id,
    String? sender,
    String? data,
    DateTime? time,
    String? type,
    bool? read,
    bool? edited,
  }) =>
      LastMessageDto(
        id: id ?? this.id,
        sender: sender ?? this.sender,
        data: data ?? this.data,
        time: time ?? this.time,
        type: type ?? this.type,
        read: read ?? this.read,
        edited: edited ?? this.edited,
      );

  factory LastMessageDto.fromJson(Map<String, dynamic> json) => _$LastMessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LastMessageDtoToJson(this);
}
