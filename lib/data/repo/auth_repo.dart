import 'dart:developer';
import 'package:bloc_test_app/data/dto/access_token_dto.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AuthRepository {
  static final Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  static Future<void> logOut() async {
  //   const logoutUrl = "${ApiConstants.devEndpoint}auth/logout";
  //   final token = await SharedPrefsHelper.GetSessionToken();
  //   await dio.delete(logoutUrl,
  //       options: Options(headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer ${token.toString()}',
  //         'accept': 'application/json',
  //       }));
    SharedPrefsHelper.DeleteSession();
    //exit(0);
  }

  static Future<void> connectToWebSocket() async {
    final wsUrl = Uri.parse(
        'ws${ApiConstants.devEndpoint.replaceAll("https", "")}websocket/messages?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ik9wZXIiLCJleHAiOjE3MDkwNTg2NDF9.r_pWEY33C15GEXuo2oIbcYYKTfTDMRG0D-5ra4iH7Fg');
    final channel = WebSocketChannel.connect(wsUrl);
    await channel.ready;
    while (true) {
      channel.sink
          .add('{"type": "message", "to": "Vasya", "message": "message"}');
      channel.stream.listen((message) {
        //channel.sink.add('received!');
        log(message.toString());
      });
      channel.sink.close();
    }
  }

  static Future<String?> logInData(String username, String password) async {
    FormData data = FormData.fromMap({
      "username": username,
      "password": password,
    });
    try {
      Response response =
          await dio.post('${ApiConstants.devEndpoint}auth/token', data: data);
      if (response.statusCode == 200) {
        final accessToken = AccessTokenDto.fromJson(response.data);
        log(accessToken.accessToken.toString());
        SharedPrefsHelper.SetSessionToken(accessToken.accessToken.toString());
        log(accessToken.accessToken);
        return accessToken.accessToken;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<bool> signInData(String name, String email, String pass) async {
    Map<String, dynamic> data = {
      "username": name,
      "password": pass,
      "email": email,
    };

    try {
      Response response =
          await dio.post('${ApiConstants.devEndpoint}register', data: data);
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
