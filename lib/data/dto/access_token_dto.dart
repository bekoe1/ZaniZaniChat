import 'package:json_annotation/json_annotation.dart';

part'access_token_dto.g.dart';

@JsonSerializable()
class AccessTokenDto {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "token_type")
  final String tokenType;

  AccessTokenDto({
    required this.accessToken,
    required this.tokenType,
  });

  factory AccessTokenDto.fromJson(Map<String, dynamic> json) => _$AccessTokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenDtoToJson(this);
}