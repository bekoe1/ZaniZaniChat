// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialogs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DialogsDto _$DialogsDtoFromJson(Map<String, dynamic> json) => DialogsDto(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DialogsDtoToJson(DialogsDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['_id'] as String,
      type: json['type_'] as String,
      picture: json['picture'],
      name: json['name'],
      lastMessage: json['last_message'] == null
          ? null
          : LastMessage.fromJson(json['last_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      '_id': instance.id,
      'type_': instance.type,
      'picture': instance.picture,
      'name': instance.name,
      'last_message': instance.lastMessage,
    };

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => LastMessage(
      k: json['k'] as String,
      v: MessageValueDto.fromJson(json['v'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LastMessageToJson(LastMessage instance) =>
    <String, dynamic>{
      'k': instance.k,
      'v': instance.v,
    };

MessageValueDto _$MessageValueDtoFromJson(Map<String, dynamic> json) =>
    MessageValueDto(
      sender: json['sender'] as String,
      data: json['data'] as String,
      time: DateTime.parse(json['time'] as String),
      type: json['type'] as String,
      read: json['read'] as bool,
      edited: json['edited'] as bool,
    );

Map<String, dynamic> _$MessageValueDtoToJson(MessageValueDto instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'data': instance.data,
      'time': instance.time.toIso8601String(),
      'type': instance.type,
      'read': instance.read,
      'edited': instance.edited,
    };
