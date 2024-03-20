import 'dart:developer';

import 'package:bloc_test_app/data/dto/dialogs_dto.dart';
import 'package:bloc_test_app/data/mapper/dialog_mapper.dart';
import 'package:bloc_test_app/data/repo/auth_repo.dart';
import 'package:bloc_test_app/domain/all_dialogs_model.dart';
import 'package:bloc_test_app/domain/dialog_model.dart';
import 'package:dio/dio.dart';

import '../../utils/internal_storage_helper.dart';
import '../../utils/network/constants.dart';

class DialogsRepo {
  static Future<PaginatedDialogsModel?> GetDialogs(int page) async {
    final token = await SharedPrefsHelper.GetSessionToken();
    Map<String, dynamic> data = {
      "session": token,
      "page": page,
    };
    final response = await AuthRepository.dio
        .post("${ApiConstants.devEndpoint}chats/all", data: data);
    if (response.statusCode == 400) {
      log("pusto");
      return null;
    }
    final List<dynamic> dialogsList = response.data;
    final List<DialogDto> dialogs =
        dialogsList.map((e) => (DialogDto.fromJson(e))).toList();
    return PaginatedDialogsModel(
        dialogs: dialogs.map((e) => (e.toModel())).toList());
  }

  static Future<void> DeleteDialog(String chatId) async {
    final token = await SharedPrefsHelper.GetSessionToken();
    Map<String, dynamic> data = {
      "chat_id": chatId,
    };
    final response = await AuthRepository.dio
        .post("${ApiConstants.devEndpoint}chats/delete");
  }

  static void GetMyProfileInfo() async {
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
