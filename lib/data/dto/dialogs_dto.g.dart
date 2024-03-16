// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialogs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DialogDto _$DialogDtoFromJson(Map<String, dynamic> json) => DialogDto(
      chatId: json['chat_id'] as String,
      dialogsDtoWith: WithDto.fromJson(json['with'] as Map<String, dynamic>),
      id: json['_id'] as String,
      sender: json['sender'] as String,
      message: json['message'] as String,
      time: DateTime.parse(json['time'] as String),
      type: json['type'] as String,
      read: json['read'] as bool,
      profilePic: json['profile_pic'],
    );

Map<String, dynamic> _$DialogDtoToJson(DialogDto instance) => <String, dynamic>{
      'chat_id': instance.chatId,
      'with': instance.dialogsDtoWith,
      '_id': instance.id,
      'sender': instance.sender,
      'message': instance.message,
      'time': instance.time.toIso8601String(),
      'type': instance.type,
      'read': instance.read,
      'profile_pic': instance.profilePic,
    };

WithDto _$WithDtoFromJson(Map<String, dynamic> json) => WithDto(
      username: json['username'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$WithDtoToJson(WithDto instance) => <String, dynamic>{
      'username': instance.username,
      'id': instance.id,
    };
