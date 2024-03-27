class DialogsModel {
  final String message;
  final List<DialogDataModel> data;

  DialogsModel({
    required this.message,
    required this.data,
  });

  DialogsModel copyWith({
    String? message,
    List<DialogDataModel>? data,
  }) =>
      DialogsModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );
}

class DialogDataModel {
  final String id;
  final String type;
  final dynamic picture;
  final dynamic name;
  final LastMessageModel? lastMessage;

  DialogDataModel({
    required this.id,
    required this.type,
    required this.picture,
    required this.name,
    this.lastMessage,
  });

  DialogDataModel copyWith({
    String? id,
    String? type,
    dynamic picture,
    dynamic name,
    LastMessageModel? lastMessage,
  }) =>
      DialogDataModel(
        id: id ?? this.id,
        type: type ?? this.type,
        picture: picture ?? this.picture,
        name: name ?? this.name,
        lastMessage: lastMessage ?? this.lastMessage,
      );
}

class LastMessageModel {
  final String k;
  final MessageValueModel v;

  LastMessageModel({
    required this.k,
    required this.v,
  });

  LastMessageModel copyWith({
    String? k,
    MessageValueModel? v,
  }) =>
      LastMessageModel(
        k: k ?? this.k,
        v: v ?? this.v,
      );
}

class MessageValueModel {
  final String sender;
  final String data;
  final DateTime time;
  final String type;
  final bool read;
  final bool edited;

  MessageValueModel({
    required this.sender,
    required this.data,
    required this.time,
    required this.type,
    required this.read,
    required this.edited,
  });

  MessageValueModel copyWith({
    String? sender,
    String? data,
    DateTime? time,
    String? type,
    bool? read,
    bool? edited,
  }) =>
      MessageValueModel(
        sender: sender ?? this.sender,
        data: data ?? this.data,
        time: time ?? this.time,
        type: type ?? this.type,
        read: read ?? this.read,
        edited: edited ?? this.edited,
      );
}
