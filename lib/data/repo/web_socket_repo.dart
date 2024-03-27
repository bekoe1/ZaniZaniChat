import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc_test_app/data/dto/incoming_message_dto.dart';
import 'package:bloc_test_app/data/mapper/message_mapper.dart';
import 'package:bloc_test_app/domain/message_model.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:bloc_test_app/utils/network/constants.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketRepo {
  static WebSocketChannel? channel;

  late StreamController<MessageModel> messageController;

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
      channel = WebSocketChannel.connect(
          Uri.parse(WebSocketConstants.devEndpoint + token!));
      channel!.stream.listen(
        (event) {
           final dto =
              IncomingMessageDto.fromJson(jsonDecode(jsonDecode(event)));
           messageController.add(dto.toModel());
          log(event.toString());
        },
        onDone: () {
          log('Connection closed');
        },
        onError: (error) {
          log('Error: $error');
        },
      );
    }
  }

  void send(dynamic data) {
    if (channel == null && channel!.closeCode != null) {
      log("соединение отсутствует");
      return;
    } else {
      channel!.sink.add(data);
    }
  }

  Stream<MessageModel> messageUpdate() {
    return messageController.stream;
  }
  void disconnect() async {
    if (channel == null) {
      log("соединение уже закрыто");
      return;
    } else {
      channel!.sink.close();
      messageController.close();
      initializeMessageControllers();
    }
  }
}
