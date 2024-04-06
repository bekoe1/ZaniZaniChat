import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketRepo {
  static WebSocketChannel? channel;
  late StreamController<String> messageController;
  bool closed = false;
  void initializeMessageControllers() {
    messageController = StreamController.broadcast();
  }

  void connect() async {
    initializeMessageControllers();
    final token = await SharedPrefsHelper.GetSessionToken();
    if (channel != null && channel!.closeCode != null) {
      log("соединение с веб сокетом уже открыто");
      return;
    } else {
      closed = false;
      channel = WebSocketChannel.connect(
          Uri.parse(WebSocketConstants.devEndpoint + token!));
      channel!.stream.listen(
        (event) {
          // final dto =
          //    IncomingMessageDto.fromJson(jsonDecode(jsonDecode(event)));
          // messageController.add(dto.toModel());
          log(event.toString());
        },
        onDone: () {
          log('Connection closed');
          if(!closed){
            log("попытка переподключения");
            reconnect();
          }
        },
        onError: (error) {
          log('Error: $error');
          reconnect();
        },
      );
    }
  }

  void reconnect() {
    Future.delayed(const Duration(seconds: 5)).then((value) => (connect()));
  }

  void send(dynamic data) {
    if (channel == null && channel!.closeCode != null) {
      log("соединение отсутствует");
      return;
    } else {
      channel!.sink.add(data);
    }
  }

  // Stream<MessageModel> messageUpdate() {
  //   return messageController.stream;
  // }
  void disconnect() async {
    if (channel == null) {
      log("соединение уже закрыто");
      return;
    } else {
      closed = true;
      channel!.sink.close();
      messageController.close();
      initializeMessageControllers();
    }
  }
}
