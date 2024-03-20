// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_accounts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAccountsDto _$SearchAccountsDtoFromJson(Map<String, dynamic> json) =>
    SearchAccountsDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => AccountDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchAccountsDtoToJson(SearchAccountsDto instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => AccountDto(
      username: json['username'] as String,
      id: json['_id'] as String,
      profilePhoto: json['profile_photo'],
    );

Map<String, dynamic> _$AccountDtoToJson(AccountDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      '_id': instance.id,
      'profile_photo': instance.profilePhoto,
    };
