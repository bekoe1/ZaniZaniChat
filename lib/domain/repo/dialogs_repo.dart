

import 'package:bloc_test_app/domain/models/dialogs.dart';

abstract class DialogsRepo{
  Future<String> checkIfDialogExists(String userID);
  Future<String> createNewChat(String userId);
  Future<int> getNumberOfDialogPages();
  Future<void> deleteDialog(String chatId, bool deleteForBoth);
  Future<DialogsModel?> getDialogs(int page);
  Future<void> fetchDialogWithUser(String chatId);
}