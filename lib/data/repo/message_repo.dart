import 'dart:async';

import 'package:bloc_test_app/data/repo/web_socket_repo.dart';
import 'package:bloc_test_app/domain/message_model.dart';

class MessageRepo {
  final WebSocketRepo wsRepo = WebSocketRepo();
  StreamSubscription? messageSubscription;

  void sendTextMessage(MessageModel model) async {
    if (model.messageInfo?.messageData != null) {
      wsRepo.send(model);
    }
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
