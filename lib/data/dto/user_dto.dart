import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    String? email,
    String? image,
    required String password,
    required String username,
    required int id,
  }) = _UserDto;
}
