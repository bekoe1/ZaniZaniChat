// import 'dart:async';
// import 'dart:convert';
// import 'web_socket_repo.dart';
//
// class MessageRepo {
//   final WebSocketRepo wsRepo = WebSocketRepo();
//   StreamSubscription? messageSubscription;
//
//   void sendTextMessage(String text, String chatId) async {
//     Map<String, dynamic> data = {
//       "type_": "text",
//       "chat_id": chatId,
//       "data": text
//     };
//       wsRepo.send(json.encode(data));
//   }
//
//   void subscribeToMessageUpdates(
//       void Function() onMessageReceived) {
//     messageSubscription = wsRepo.messageUpdate().listen((event) {
//       onMessageReceived(event);
//     });
//   }
//
//   void unSubscribeToMessageUpdates() {
//     messageSubscription?.cancel();
//     messageSubscription = null;
//   }
// }
