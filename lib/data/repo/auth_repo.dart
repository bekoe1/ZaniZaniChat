
import 'dart:io';
import 'dart:developer';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:shared_preferences/shared_preferences.dart';
class AuthRepository {
  static final Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));
  static Future<void> LogOut() async{
    final logoutUrl = "http://147.45.74.185:8000/logout";
    Map<String, dynamic> data = {
      "session" : SharedPrefsHelper.sessionName
    };
    dio.post(logoutUrl, data: data);
    SharedPrefsHelper.DeleteSession();
    exit(0);
  }
  static Future<void> ConnectToWebSocket() async {
    final wsUrl = Uri.parse(
        'ws://147.45.74.185:8000/websocket/messages?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ik9wZXIiLCJleHAiOjE3MDkwNTg2NDF9.r_pWEY33C15GEXuo2oIbcYYKTfTDMRG0D-5ra4iH7Fg');
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

  static Future<String?> LogInData(String username, String password) async {
    Map<String, dynamic> data = {
      "username": username,
      "password": password,
      "device_info" : "dd",
    };
    try {
      Response response =
          await dio.post('http://147.45.74.185:8000/new_session', data: data);

      if (response.statusCode == 200) {
        return response.data.toString();
      }

    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<bool> SignInData(String name, String email, String pass) async {
    Map<String, dynamic> data = {
      "username": name,
      "password": pass,
      "email": email,
    };

    try {
      Response response =
          await dio.post('http://147.45.74.185:8000/register', data: data);
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
