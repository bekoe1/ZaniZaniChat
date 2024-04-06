import 'dart:developer';

import 'package:bloc_test_app/domain/models/my_account_info.dart';
import 'package:bloc_test_app/domain/repo/account_info_repo.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:dio/dio.dart';

class MyAccountDataSource implements AccountInfoRepo {
  @override
  Future<String?> changeDescription(String data) {
    // TODO: implement changeDescription
    throw UnimplementedError();
  }

  @override
  Future<String?> changeNickname(String data) {
    // TODO: implement changeNickname
    throw UnimplementedError();
  }

  @override
  Future<String?> changePicture(String data) {
    // TODO: implement changePicture
    throw UnimplementedError();
  }

  @override
  Future<String?> changeSurname(String data) {
    // TODO: implement changeSurname
    throw UnimplementedError();
  }

  @override
  Future<String?> changeUsername(String data) {
    // TODO: implement changeUsername
    throw UnimplementedError();
  }

  @override
  Future<MyAccountInfoData?> getData() async {
    final token = await SharedPrefsHelper.GetSessionToken();
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
}
