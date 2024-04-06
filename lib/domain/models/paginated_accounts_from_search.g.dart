// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_accounts_from_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchData _$SearchDataFromJson(Map<String, dynamic> json) => SearchData(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => SearchedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchDataToJson(SearchData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

SearchedAccount _$SearchedAccountFromJson(Map<String, dynamic> json) =>
    SearchedAccount(
      username: json['username'] as String,
      id: json['_id'] as String,
      profilePhotos: json['profile_photos'],
    );

Map<String, dynamic> _$SearchedAccountToJson(SearchedAccount instance) =>
    <String, dynamic>{
      'username': instance.username,
      '_id': instance.id,
      'profile_photos': instance.profilePhotos,
    };
