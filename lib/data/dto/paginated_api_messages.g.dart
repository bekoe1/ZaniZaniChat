// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_api_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedMessagesFromApi _$PaginatedMessagesFromApiFromJson(
        Map<String, dynamic> json) =>
    PaginatedMessagesFromApi(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : PaginatedMessagesFromApiData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginatedMessagesFromApiToJson(
        PaginatedMessagesFromApi instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

PaginatedMessagesFromApiData _$PaginatedMessagesFromApiDataFromJson(
        Map<String, dynamic> json) =>
    PaginatedMessagesFromApiData(
      id: json['_id'] as String?,
      type: json['type_'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageFromApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedMessagesFromApiDataToJson(
        PaginatedMessagesFromApiData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type_': instance.type,
      'participants': instance.participants,
      'messages': instance.messages,
    };

MessageFromApiDto _$MessageFromApiDtoFromJson(Map<String, dynamic> json) =>
    MessageFromApiDto(
      id: json['_id'] as String?,
      sender: json['sender'] as String,
      data: json['data'] as String,
      time: DateTime.parse(json['time'] as String),
      type: json['type'] as String?,
      read: json['read'] as bool?,
      edited: json['edited'] as bool?,
    );

Map<String, dynamic> _$MessageFromApiDtoToJson(MessageFromApiDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sender': instance.sender,
      'data': instance.data,
      'time': instance.time.toIso8601String(),
      'type': instance.type,
      'read': instance.read,
      'edited': instance.edited,
    };
