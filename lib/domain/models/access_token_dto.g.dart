// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenModel _$AccessTokenModelFromJson(Map<String, dynamic> json) =>
    AccessTokenModel(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
    );

Map<String, dynamic> _$AccessTokenModelToJson(AccessTokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };
