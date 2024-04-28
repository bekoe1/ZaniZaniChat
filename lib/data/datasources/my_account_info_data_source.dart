import 'dart:developer';

import 'package:bloc_test_app/domain/models/my_account_info.dart';
import 'package:bloc_test_app/domain/repo/account_info_repo.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:dio/dio.dart';

class MyAccountDataSource implements AccountInfoRepo {
  @override
  Future<MyAccountInfoData?> getData() async {
    final token = await SharedPrefsHelper.getSessionToken();
    final response = await ApiConstants.dio.get(
      "${ApiConstants.devEndpoint}me/",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token.toString()}',
          'accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      return MyAccountInfo.fromJson(response.data).data;
    } else {
      log(response.statusMessage.toString());
      return null;
    }
  }

  @override
  Future<String?> changeDescription(String data) {
    // TODO: implement changeDescription
    throw UnimplementedError();
  }

  @override
  Future<String?> changeNameAndSurname(String name, String surname)async {
    final token = await SharedPrefsHelper.getSessionToken();
    try {
      final responseFromNameChanging = await ApiConstants.dio.put(
        "${ApiConstants.devEndpoint}me/name",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token.toString()}',
            'accept': 'application/json',
          },
        ),
        data: {"data": name},
      );
      final responseFromSurameChanging = await ApiConstants.dio.put(
        "${ApiConstants.devEndpoint}me/surname",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token.toString()}',
            'accept': 'application/json',
          },
        ),
        data: {"data": surname},
      );
      if(responseFromNameChanging.statusCode == 200 && responseFromSurameChanging.statusCode == 200){
        return "ok";
      }
      else{
        return "Произошла ошибка при загрузке данных";
      }
    }
    catch(e){
      return e.toString();
    }
  }

  @override
  Future<String?> changePicture(String data) {
    // TODO: implement changePicture
    throw UnimplementedError();
  }

  @override
  Future<String?> changeUsername(String data) async{
    final token = await SharedPrefsHelper.getSessionToken();
    try {
      final response = await ApiConstants.dio.put(
        "${ApiConstants.devEndpoint}me/username",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token.toString()}',
            'accept': 'application/json',
          },
        ),
        data: {"data": data},
      );
      if(response.statusCode == 200){
        return "ok";
      }
      else{
        return response.statusMessage;
      }
    }
    catch(e){
      return e.toString();
    }
  }
}
