import 'dart:async';
import 'dart:developer';

import 'package:bloc_test_app/data/dto/dialogs_dto.dart';
import 'package:bloc_test_app/data/mapper/dialog_mapper.dart';
import 'package:bloc_test_app/data/repo/auth_repo.dart';
import 'package:bloc_test_app/domain/dialog_model.dart';
import 'package:bloc_test_app/domain/message_model.dart';
import 'package:dio/dio.dart';

import '../../utils/internal_storage_helper.dart';
import '../../utils/network/constants.dart';

class DialogsRepo {
  static Future<String> checkIfDialogExists(String userID) async {
    final token = await SharedPrefsHelper.GetSessionToken();
    final response = await AuthRepository.dio
        .get("${ApiConstants.devEndpoint}chats/is_chat?with_user_id=$userID",
            options: Options(headers: {
              'Authorization': 'Bearer ${token.toString()}',
              'accept': 'application/json',
            }));
    return response.data["data"].toString();
  }

  static Future<String> createNewChat(String userId) async {
    final token = await SharedPrefsHelper.GetSessionToken();

    final Map<String, dynamic> data = {
      "participants": [userId],
      "name": null,
    };
    final response = await AuthRepository.dio.post(
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

  static Future<void> fetchDialogWithUser(String chatId) async {
    final token = await SharedPrefsHelper.GetSessionToken();


    final response = await AuthRepository.dio.get(
      "${ApiConstants.devEndpoint}chats?chat_id=$chatId",
      options: Options(
        headers:  {
          'Authorization': 'Bearer ${token.toString()}',
          'accept': 'application/json',
        }
      ),
    );

    log(response.data.toString());
  }

  static Future<DialogsModel?> getDialogs(int page) async {
    final token = await SharedPrefsHelper.GetSessionToken();

    final response = await AuthRepository.dio
        .get("${ApiConstants.devEndpoint}user/me/chats?page=$page",
            options: Options(headers: {
              'Authorization': 'Bearer ${token.toString()}',
              'accept': 'application/json',
            }));
    if (response.statusCode != 200) {
      log("error${response.statusMessage}");
      return null;
    }
    final dialogsList = response.data;
    final dto = DialogsDto.fromJson(dialogsList);
    return dto.toModel();
  }

  static Future<void> deleteDialog(String chatId) async {
    final token = await SharedPrefsHelper.GetSessionToken();
    Map<String, dynamic> data = {
      "chat_id": chatId.toString(),
    };
    final response = await AuthRepository.dio
        .post("${ApiConstants.devEndpoint}chats/delete");
  }

  static Future<int> getNumberOfDialogPages() async {
    final token = await SharedPrefsHelper.GetSessionToken();
    final response = await AuthRepository.dio
        .get("${ApiConstants.devEndpoint}user/me/chat/pages",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${token.toString()}',
              'accept': 'application/json',
            }));
    final Map<String, dynamic> responseData = response.data;
    return responseData["data"];
  }

  static void getMyProfileInfo() async {
    final token = await SharedPrefsHelper.GetSessionToken();

    final response =
        await AuthRepository.dio.get("${ApiConstants.devEndpoint}user/me",
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${token.toString()}',
              'accept': 'application/json',
            }));
    log(token.toString());
  }
}
