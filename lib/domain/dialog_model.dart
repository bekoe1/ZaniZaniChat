class DialogModel {
  final String chatId;
  final WithModel dialogsDtoWith;
  final String id;
  final String sender;
  final String message;
  final DateTime time;
  final String type;
  final bool read;
  final dynamic profilePic;

  DialogModel({
    required this.chatId,
    required this.dialogsDtoWith,
    required this.id,
    required this.sender,
    required this.message,
    required this.time,
    required this.type,
    required this.read,
    required this.profilePic,
  });
}

class WithModel {
  final String username;
  final String id;

  WithModel({
    required this.username,
    required this.id,
  });
}
