// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialogs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DialogsModel _$DialogsModelFromJson(Map<String, dynamic> json) => DialogsModel(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DialogsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DialogsModelToJson(DialogsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

DialogsData _$DialogsDataFromJson(Map<String, dynamic> json) => DialogsData(
      id: json['_id'] as String,
      lastMessage:
          LastMessage.fromJson(json['last_message'] as Map<String, dynamic>),
      name: json['name'] as String,
      profilePhoto: json['profile_photo'] as List<dynamic>,
    );

Map<String, dynamic> _$DialogsDataToJson(DialogsData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'last_message': instance.lastMessage,
      'name': instance.name,
      'profile_photo': instance.profilePhoto,
    };

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => LastMessage(
      id: json['_id'] as String,
      sender: json['sender'] as String,
      data: json['data'] as String,
      time: DateTime.parse(json['time'] as String),
      type: json['type'] as String,
      read: json['read'] as bool,
      edited: json['edited'] as bool,
    );

Map<String, dynamic> _$LastMessageToJson(LastMessage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sender': instance.sender,
      'data': instance.data,
      'time': instance.time.toIso8601String(),
      'type': instance.type,
      'read': instance.read,
      'edited': instance.edited,
    };
