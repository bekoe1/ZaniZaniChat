// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyProfileInfoDto _$MyProfileInfoDtoFromJson(Map<String, dynamic> json) =>
    MyProfileInfoDto(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProfileInfoDtoToJson(MyProfileInfoDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] == null
          ? null
          : Email.fromJson(json['email'] as Map<String, dynamic>),
      profilePhotos: json['profile_photos'] as List<dynamic>?,
      description: json['description'] as String?,
      chats: (json['chats'] as List<dynamic>?)
          ?.map((e) => Chat.fromJson(e as Map<String, dynamic>))
          .toList(),
      systemChat: json['system_chat'] as String?,
      privacy: json['privacy'] == null
          ? null
          : Privacy.fromJson(json['privacy'] as Map<String, dynamic>),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'profile_photos': instance.profilePhotos,
      'description': instance.description,
      'chats': instance.chats,
      'system_chat': instance.systemChat,
      'privacy': instance.privacy,
      'name': instance.name,
      'surname': instance.surname,
    };

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      chatId: json['chat_id'] as String?,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'chat_id': instance.chatId,
    };

Email _$EmailFromJson(Map<String, dynamic> json) => Email(
      adress: json['adress'] as String?,
      confirmed: json['confirmed'] as bool?,
    );

Map<String, dynamic> _$EmailToJson(Email instance) => <String, dynamic>{
      'adress': instance.adress,
      'confirmed': instance.confirmed,
    };

Privacy _$PrivacyFromJson(Map<String, dynamic> json) => Privacy(
      description: json['description'] == null
          ? null
          : Description.fromJson(json['description'] as Map<String, dynamic>),
      findMe: json['find_me'] == null
          ? null
          : Description.fromJson(json['find_me'] as Map<String, dynamic>),
      profilePhotos: json['profile_photos'] == null
          ? null
          : Description.fromJson(
              json['profile_photos'] as Map<String, dynamic>),
      lastOnline: json['last_online'] == null
          ? null
          : Description.fromJson(json['last_online'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrivacyToJson(Privacy instance) => <String, dynamic>{
      'description': instance.description,
      'find_me': instance.findMe,
      'profile_photos': instance.profilePhotos,
      'last_online': instance.lastOnline,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      type: json['type_'] as String?,
      exceptions: json['exceptions'] as List<dynamic>?,
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'type_': instance.type,
      'exceptions': instance.exceptions,
    };
