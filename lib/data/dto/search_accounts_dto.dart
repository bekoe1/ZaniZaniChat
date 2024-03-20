import 'package:freezed_annotation/freezed_annotation.dart';

part'search_accounts_dto.g.dart';
@JsonSerializable()
class SearchAccountsDto {

  @JsonKey(name: "results")
  final List<AccountDto> results;

  SearchAccountsDto({
    required this.results,
  });

  factory SearchAccountsDto.fromJson(Map<String, dynamic> json) => _$SearchAccountsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAccountsDtoToJson(this);
}

@JsonSerializable()
class AccountDto {
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "profile_photo")
  final dynamic profilePhoto;

  AccountDto({
    required this.username,
    required this.id,
    required this.profilePhoto,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDtoToJson(this);
}