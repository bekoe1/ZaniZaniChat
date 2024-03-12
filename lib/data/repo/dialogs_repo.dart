import 'dart:developer';

import 'package:bloc_test_app/data/dto/dialogs_dto.dart';
import 'package:bloc_test_app/data/repo/auth_repo.dart';

import '../../utils/internal_storage_helper.dart';

class DialogsRepo {
  static Future<void> GetDialogs(int page) async{
    final token = await SharedPrefsHelper.GetSessionToken();
    log(token.toString());
    Map<String, dynamic> data = {
      "session": token,
      "page":page
    };
    final response = await AuthRepository.dio.post("http://147.45.74.185:8000/chats", data: data);
    log(response.data.toString());
  }
}
