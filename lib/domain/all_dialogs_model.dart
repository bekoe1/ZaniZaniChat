class DialogsModel {
  final String? chatId;
  final WithModel? dialogsWith;
  final String? id;
  final String? sender;
  final String? message;
  final DateTime? time;
  final String? type;
  final bool? read;
  final String? profilePic;

  DialogsModel({
    this.chatId,
    this.dialogsWith,
    this.id,
    this.sender,
    this.message,
    this.time,
    this.type,
    this.read,
    this.profilePic,
  });

}

class WithModel {
  final String? username;
  final String? id;

  WithModel({
    this.username,
    this.id,
  });

}
