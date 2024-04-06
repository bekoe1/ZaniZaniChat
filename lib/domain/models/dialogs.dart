import 'package:freezed_annotation/freezed_annotation.dart';

part 'dialogs.g.dart';
@JsonSerializable()
class DialogsModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final List<DialogsData> data;

  DialogsModel({
    required this.message,
    required this.data,
  });

  DialogsModel copyWith({
    String? message,
    List<DialogsData>? data,
  }) =>
      DialogsModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory DialogsModel.fromJson(Map<String, dynamic> json) => _$DialogsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DialogsModelToJson(this);
}

@JsonSerializable()
class DialogsData {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "last_message")
  final LastMessage lastMessage;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "profile_photo")
  final List<dynamic> profilePhoto;

  DialogsData({
    required this.id,
    required this.lastMessage,
    required this.name,
    required this.profilePhoto,
  });

  DialogsData copyWith({
    String? id,
    LastMessage? lastMessage,
    String? name,
    List<dynamic>? profilePhoto,
  }) =>
      DialogsData(
        id: id ?? this.id,
        lastMessage: lastMessage ?? this.lastMessage,
        name: name ?? this.name,
        profilePhoto: profilePhoto ?? this.profilePhoto,
      );

  factory DialogsData.fromJson(Map<String, dynamic> json) => _$DialogsDataFromJson(json);

  Map<String, dynamic> toJson() => _$DialogsDataToJson(this);
}

@JsonSerializable()
class LastMessage {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "sender")
  final String sender;
  @JsonKey(name: "data")
  final String data;
  @JsonKey(name: "time")
  final DateTime time;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "read")
  final bool read;
  @JsonKey(name: "edited")
  final bool edited;

  LastMessage({
    required this.id,
    required this.sender,
    required this.data,
    required this.time,
    required this.type,
    required this.read,
    required this.edited,
  });

  LastMessage copyWith({
    String? id,
    String? sender,
    String? data,
    DateTime? time,
    String? type,
    bool? read,
    bool? edited,
  }) =>
      LastMessage(
        id: id ?? this.id,
        sender: sender ?? this.sender,
        data: data ?? this.data,
        time: time ?? this.time,
        type: type ?? this.type,
        read: read ?? this.read,
        edited: edited ?? this.edited,
      );

  factory LastMessage.fromJson(Map<String, dynamic> json) => _$LastMessageFromJson(json);

  Map<String, dynamic> toJson() => _$LastMessageToJson(this);
}
