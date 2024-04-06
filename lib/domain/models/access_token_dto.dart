import 'package:json_annotation/json_annotation.dart';

part'access_token_dto.g.dart';

@JsonSerializable()
class AccessTokenModel {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "token_type")
  final String tokenType;

  AccessTokenModel({
    required this.accessToken,
    required this.tokenType,
  });

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) => _$AccessTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenModelToJson(this);
}