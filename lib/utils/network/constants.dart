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

abstract class OtherConstants {
  static final accountCircle =
      "https://img.freepik.com/free-photo/close-up-on-adorable-kitten-on-couch_23-2150782439.jpg";
}
