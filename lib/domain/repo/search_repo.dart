import 'package:bloc_test_app/domain/models/paginated_accounts_from_search.dart';

abstract class SearchRepo{
  Future<List<SearchedAccount>?> searchAccounts(String name);
}