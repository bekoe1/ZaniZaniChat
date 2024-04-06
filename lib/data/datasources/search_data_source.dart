import 'package:bloc_test_app/domain/models/paginated_accounts_from_search.dart';
import 'package:bloc_test_app/domain/repo/search_repo.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:dio/dio.dart';

import '../../utils/internal_storage_helper.dart';

class SearchDataSource implements SearchRepo {
  @override
  Future<List<SearchedAccount>?> searchAccounts(String name) async {
    final token = await SharedPrefsHelper.GetSessionToken();
    Map<String, dynamic> data = {
      "query": name,
    };
    final response = await ApiConstants.dio.get(
      "${ApiConstants.devEndpoint}user/search/$name",
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token.toString()}',
          'accept': 'application/json',
        },
      ),
    );
    if(response.statusCode == 200) {
      final accounts = SearchData.fromJson(response.data);
      return accounts.data;
    }
    else{
      return null;
    }
  }
}
