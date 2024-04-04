// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenDto _$AccessTokenDtoFromJson(Map<String, dynamic> json) =>
    AccessTokenDto(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
    );

Map<String, dynamic> _$AccessTokenDtoToJson(AccessTokenDto instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };
