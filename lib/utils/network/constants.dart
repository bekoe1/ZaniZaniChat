import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiConstants {
  static const devEndpoint = "http://147.45.74.185:8000/";

  static final Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));
}

class WebSocketConstants {
  static const devEndpoint = "ws://147.45.74.185:8000/ws/messages?token=";
}

class OtherConstants {
  final accountCircle = Image.network(
    "https://cdn0.iconfinder.com/data/icons/actions-ono-system-core/30/account_circle-profile-profile_picture-default_picture-1024.png",
    color: Colors.white,
    alignment: Alignment.bottomCenter,
  );
}
