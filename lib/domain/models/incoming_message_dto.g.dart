// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incoming_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomingMessageDto _$IncomingMessageDtoFromJson(Map<String, dynamic> json) =>
    IncomingMessageDto(
      type: json['type_'] as String?,
      code: json['code'],
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      messageInfo: json['message_info'] == null
          ? null
          : MessageInfoDto.fromJson(
              json['message_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IncomingMessageDtoToJson(IncomingMessageDto instance) =>
    <String, dynamic>{
      'type_': instance.type,
      'code': instance.code,
      'time': instance.time?.toIso8601String(),
      'message_info': instance.messageInfo,
    };

MessageInfoDto _$MessageInfoDtoFromJson(Map<String, dynamic> json) =>
    MessageInfoDto(
      fromWho: json['from_who'] as String?,
      chatId: json['chat_id'] as String?,
      typeOfMessage: json['type_of_message'] as String?,
      messageData: json['message_data'] as String?,
      messageId: json['message_id'] as String?,
    );

Map<String, dynamic> _$MessageInfoDtoToJson(MessageInfoDto instance) =>
    <String, dynamic>{
      'from_who': instance.fromWho,
      'chat_id': instance.chatId,
      'type_of_message': instance.typeOfMessage,
      'message_data': instance.messageData,
      'message_id': instance.messageId,
    };
