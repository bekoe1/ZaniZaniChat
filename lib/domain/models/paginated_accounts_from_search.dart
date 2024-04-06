import 'package:freezed_annotation/freezed_annotation.dart';
part 'paginated_accounts_from_search.g.dart';
@JsonSerializable()
class SearchData {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final List<SearchedAccount> data;

  SearchData({
    required this.message,
    required this.data,
  });

  SearchData copyWith({
    String? message,
    List<SearchedAccount>? data,
  }) =>
      SearchData(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SearchData.fromJson(Map<String, dynamic> json) => _$SearchDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataToJson(this);
}

@JsonSerializable()
class SearchedAccount {
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "profile_photos")
  final dynamic profilePhotos;

  SearchedAccount({
    required this.username,
    required this.id,
    required this.profilePhotos,
  });

  SearchedAccount copyWith({
    String? username,
    String? id,
    dynamic profilePhotos,
  }) =>
      SearchedAccount(
        username: username ?? this.username,
        id: id ?? this.id,
        profilePhotos: profilePhotos ?? this.profilePhotos,
      );

  factory SearchedAccount.fromJson(Map<String, dynamic> json) => _$SearchedAccountFromJson(json);

  Map<String, dynamic> toJson() => _$SearchedAccountToJson(this);
}
