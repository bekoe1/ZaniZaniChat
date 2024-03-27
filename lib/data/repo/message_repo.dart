import 'dart:async';
import 'dart:convert';

import 'package:bloc_test_app/data/repo/web_socket_repo.dart';
import 'package:bloc_test_app/domain/message_model.dart';

class MessageRepo {
  final WebSocketRepo wsRepo = WebSocketRepo();
  StreamSubscription? messageSubscription;

  void sendTextMessage(String text, String chatId) async {
    Map<String, dynamic> data = {
      "type_": "text",
      "chat_id": chatId,
      "data": text
    };
      wsRepo.send(json.encode(data));
  }

  void subscribeToMessageUpdates(
      void Function(MessageModel) onMessageReceived) {
    messageSubscription = wsRepo.messageUpdate().listen((event) {
      onMessageReceived(event);
    });
  }

  void unSubscribeToMessageUpdates() {
    messageSubscription?.cancel();
    messageSubscription = null;
  }
}
