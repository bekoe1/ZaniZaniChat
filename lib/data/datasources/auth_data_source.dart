import 'dart:developer';

import 'package:bloc_test_app/domain/repo/auth_repo.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:dio/dio.dart';

import '../../domain/models/access_token_dto.dart';
import '../../utils/internal_storage_helper.dart';

class AuthDataSource implements AuthRepo {
  @override
  Future<String?> logIn(
      {required String username, required String password}) async {
    FormData data = FormData.fromMap({
      "username": username,
      "password": password,
    });

    try {
      Response response = await ApiConstants.dio
          .post('${ApiConstants.devEndpoint}auth/token', data: data);
      if (response.statusCode == 200) {
        final accessToken = AccessTokenModel.fromJson(response.data);
        SharedPrefsHelper.setSessionToken(accessToken.accessToken.toString());
        return accessToken.accessToken;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<String?> logOut() async {
    final token = await SharedPrefsHelper.getSessionToken();
    final response = await ApiConstants.dio.delete(
      "${ApiConstants.devEndpoint}auth/logout",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token.toString()}',
          'accept': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      SharedPrefsHelper.deleteSession();
      SharedPrefsHelper.deleteMyId();
      SharedPrefsHelper.deleteName();
      return null;
    } else {
      return response.data["message"];
    }
  }

  @override
  Future<bool> signIn({
    required String name,
    required String email,
    required String pass,
  }) async {
    Map<String, dynamic> data = {
      "username": name,
      "password": pass,
      "email": email,
    };

    try {
      Response response = await ApiConstants.dio
          .post('${ApiConstants.devEndpoint}auth/register', data: data);
      if (response.statusCode == 200) {
        return true;
      } else {
        log('Failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }
}
