import 'package:bloc_test_app/data/dto/search_accounts_dto.dart';
import 'package:bloc_test_app/domain/searched_account_model.dart';

extension SearchedAccFromDtoToModel on AccountDto {
  SearchedAccountModel toModel() {
    return SearchedAccountModel(
      username: username,
      id: id,
      profilePhoto: profilePhoto,
    );
  }
}
