// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialogs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DialogsDto _$DialogsDtoFromJson(Map<String, dynamic> json) => DialogsDto(
      chatId: json['chat_id'] as String?,
      dialogsDtoWith: json['with'] == null
          ? null
          : With.fromJson(json['with'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      sender: json['sender'] as String?,
      message: json['message'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      type: json['type'] as String?,
      read: json['read'] as bool?,
      profilePic: json['profile_pic'] as String?,
    );

Map<String, dynamic> _$DialogsDtoToJson(DialogsDto instance) =>
    <String, dynamic>{
      'chat_id': instance.chatId,
      'with': instance.dialogsDtoWith,
      '_id': instance.id,
      'sender': instance.sender,
      'message': instance.message,
      'time': instance.time?.toIso8601String(),
      'type': instance.type,
      'read': instance.read,
      'profile_pic': instance.profilePic,
    };

With _$WithFromJson(Map<String, dynamic> json) => With(
      username: json['username'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$WithToJson(With instance) => <String, dynamic>{
      'username': instance.username,
      'id': instance.id,
    };
