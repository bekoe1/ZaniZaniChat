
import 'dart:developer';

import 'package:bloc_test_app/data/dto/search_accounts_dto.dart';
import 'package:bloc_test_app/data/mapper/searched_accounts_mapper.dart';
import 'package:bloc_test_app/data/repo/auth_repo.dart';
import 'package:bloc_test_app/domain/paginated_searched_account_model.dart';
import 'package:bloc_test_app/domain/searched_account_model.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
class SearchRepo{
  static Future<PaginatedSearchedAccountsModel?> SearchAccounts(String name)async {
     final token = await SharedPrefsHelper.GetSessionToken();
     Map<String, dynamic> data = {
       "session": token,
       "query": name,
     };
     final response = await AuthRepository.dio.post("${ApiConstants.devEndpoint}profile/search",data: data);
     log(response.data.runtimeType.toString());
     final dto = response.data as Map<String, dynamic>;
     final accountsList = dto["results"] as List<dynamic>;
     final paginatedDto = SearchAccountsDto(results: accountsList.map((e) => (AccountDto.fromJson(e))).toList());
     log(paginatedDto.runtimeType.toString());
     return PaginatedSearchedAccountsModel(results: paginatedDto.results.map((e) => (e.toModel())).toList());
     // log("ok");
     // final List<AccountDto> dtoList = dto.map((e) => (AccountDto.fromJson(e))).toList();
     // log("ok2");
     // final List<SearchedAccountModel> modelList = dtoList.map((e) => (e.toModel())).toList();
     // log("ok3");
     // return PaginatedSearchedAccountsModel(results: modelList);
  }
}