import 'dart:developer';

import 'package:bloc_test_app/domain/models/dialogs.dart';
import 'package:bloc_test_app/domain/models/incoming_message_dto.dart';
import 'package:bloc_test_app/domain/models/paginated_dialog.dart';
import 'package:bloc_test_app/domain/repo/dialogs_repo.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:dio/dio.dart';

import '../../domain/models/message_dto.dart';
import '../../utils/internal_storage_helper.dart';

class DialogsDataSource implements DialogsRepo {
  @override
  Future<String> checkIfDialogExists(String userID) async {
    final token = await SharedPrefsHelper.getSessionToken();
    final response = await ApiConstants.dio
        .get("${ApiConstants.devEndpoint}chats/is_chat?with_user_id=$userID",
            options: Options(headers: {
              'Authorization': 'Bearer ${token.toString()}',
              'accept': 'application/json',
            }));
    return response.data["data"].toString();
  }

  @override
  //возвращает chatId
  Future<String> createNewChat(String userId) async {
    final token = await SharedPrefsHelper.getSessionToken();

    final Map<String, dynamic> data = {
      "participants": [userId],
      "name": null,
    };
    final response = await ApiConstants.dio.post(
      "${ApiConstants.devEndpoint}chats/new/",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token.toString()}',
          'accept': 'application/json',
        },
      ),
      data: data,
    );
    return response.data["data"];
  }

  @override
  Future<void> deleteDialog(String chatId, bool deleteForBoth) async {
    final token = await SharedPrefsHelper.getSessionToken();

    final Map<String, dynamic> data = {
      "obj_id": token,
      "both": deleteForBoth,
    };

    final response = await ApiConstants.dio
        .delete("${ApiConstants.devEndpoint}me/chat/", data: data);
  }

  @override
  Future<List<MessageDto>> fetchDialogWithUser({required String chatId,required int page}) async {
    final token = await SharedPrefsHelper.getSessionToken();

    final response = await ApiConstants.dio.get(
      "${ApiConstants.devEndpoint}chats?chat_id=$chatId&chat_page=$page",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token.toString()}',
          'accept': 'application/json',
        },
      ),
    );
    final messages = PaginatedDialog.fromJson( response.data);
    log(messages.data.participants.toString());
    return messages.data.messages;
  }

  @override
  Future<DialogsModel?> getDialogs(int page) async {
    final token = await SharedPrefsHelper.getSessionToken();

    final response = await ApiConstants.dio
        .get("${ApiConstants.devEndpoint}me/chats?page=$page",
            options: Options(headers: {
              'Authorization': 'Bearer ${token.toString()}',
              'accept': 'application/json',
            }));
    if (response.statusCode != 200) {
      log("error${response.statusMessage}");
      return null;
    } else {
      return DialogsModel.fromJson(response.data);
    }
  }

  @override
  Future<int> getNumberOfDialogPages() async {
    final token = await SharedPrefsHelper.getSessionToken();
    final response = await ApiConstants.dio
        .get("${ApiConstants.devEndpoint}user/me/chat/pages",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${token.toString()}',
              'accept': 'application/json',
            }));
    final Map<String, dynamic> responseData = response.data;
    return responseData["data"];
  }
}
