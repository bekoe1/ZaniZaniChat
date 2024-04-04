class PaginatedMessagesFromApiModel {
  final String? message;
  final PaginatedMessagesFromApiDataModel? data;

  PaginatedMessagesFromApiModel({
    this.message,
    this.data,
  });

  PaginatedMessagesFromApiModel copyWith({
    String? message,
    PaginatedMessagesFromApiDataModel? data,
  }) =>
      PaginatedMessagesFromApiModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

}

class PaginatedMessagesFromApiDataModel {
  final String? id;
  final String? type;
  final List<String>? participants;
  final List<MessageFromApiModel> messages;

  PaginatedMessagesFromApiDataModel({
    this.id,
    this.type,
    this.participants,
    required this.messages,
  });

  PaginatedMessagesFromApiDataModel copyWith({
    String? id,
    String? type,
    List<String>? participants,
    required List<MessageFromApiModel> messages,
  }) =>
      PaginatedMessagesFromApiDataModel(
        id: id ?? this.id,
        type: type ?? this.type,
        participants: participants ?? this.participants,
        messages: messages ?? this.messages,
      );

}

class MessageFromApiModel {
  final String? id;
  final String sender;
  final String? data;
  final DateTime time;
  final String? type;
  final bool? read;
  final bool? edited;

  MessageFromApiModel({
    this.id,
    required this.sender,
    this.data,
    required this.time,
    this.type,
    this.read,
    this.edited,
  });

  MessageFromApiModel copyWith({
    String? id,
    String? sender,
    String? data,
    DateTime? time,
    String? type,
    bool? read,
    bool? edited,
  }) =>
      MessageFromApiModel(
        id: id ?? this.id,
        sender: sender ?? this.sender,
        data: data ?? this.data,
        time: time ?? this.time,
        type: type ?? this.type,
        read: read ?? this.read,
        edited: edited ?? this.edited,
      );

}
