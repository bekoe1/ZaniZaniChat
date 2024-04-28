import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc_test_app/domain/models/message_dto.dart';
import 'package:bloc_test_app/domain/models/ws_message_model.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/incoming_message_dto.dart';

class WebSocketRepo {
  static WebSocketChannel? channel;
  late StreamController<MessageDto> messageController;
  bool closed = false;

  void initializeMessageControllers() {
    messageController = StreamController.broadcast();
  }

  void connect() async {
    initializeMessageControllers();
    final token = await SharedPrefsHelper.getSessionToken();
    if (channel != null && channel!.closeCode == null) {
      log("соединение с веб сокетом уже открыто");
      return;
    } else {
      closed = false;
      channel = WebSocketChannel.connect(
          Uri.parse(WebSocketConstants.devEndpoint + token!));
      log("соединение работает");
      channel!.stream.listen(
        (event) {
          log(event.toString());
          final dto = MessageDto.fromJson(jsonDecode(jsonDecode(event)));
          messageController.add(dto);
          log(event.toString());
        },
        onDone: () {
          log('Connection closed');
          if (!closed) {
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
    Future.delayed(const Duration(seconds: 3)).then((value) => (connect()));
  }

  void send(WsMessage data)  {
    if (channel == null || channel!.closeCode != null) {
      log("соединение отсутствует");
      connect();
      return;
    } else {
      try{
        channel!.sink.add(jsonEncode(data));
        log(jsonEncode(data.toJson()).toString());

      }
      catch(e){
        log("ошибка при отправке - $e");
      }
    }
  }


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
