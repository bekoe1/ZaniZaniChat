import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_account_info.g.dart';
@JsonSerializable()
class MyAccountInfo {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final MyAccountInfoData data;

  MyAccountInfo({
    required this.message,
    required this.data,
  });

  MyAccountInfo copyWith({
    String? message,
    MyAccountInfoData? data,
  }) =>
      MyAccountInfo(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory MyAccountInfo.fromJson(Map<String, dynamic> json) => _$MyAccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MyAccountInfoToJson(this);
}

@JsonSerializable()
class MyAccountInfoData {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "email")
  final Email email;
  @JsonKey(name: "profile_photos")
  //напомнить сене
  final List<String> profilePhotos;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "chats")
  final List<Chat> chats;
  @JsonKey(name: "system_chat")
  final String systemChat;
  @JsonKey(name: "privacy")
  final Privacy privacy;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "surname")
  final String surname;

  MyAccountInfoData({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.profilePhotos,
    required this.description,
    required this.chats,
    required this.systemChat,
    required this.privacy,
    required this.name,
    required this.surname,
  });

  MyAccountInfoData copyWith({
    String? id,
    String? username,
    String? password,
    Email? email,
    required List<String> profilePhotos,
    String? description,
    List<Chat>? chats,
    String? systemChat,
    Privacy? privacy,
    String? name,
    String? surname,
  }) =>
      MyAccountInfoData(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        profilePhotos: profilePhotos ?? this.profilePhotos,
        description: description ?? this.description,
        chats: chats ?? this.chats,
        systemChat: systemChat ?? this.systemChat,
        privacy: privacy ?? this.privacy,
        name: name ?? this.name,
        surname: surname ?? this.surname,
      );

  factory MyAccountInfoData.fromJson(Map<String, dynamic> json) => _$MyAccountInfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyAccountInfoDataToJson(this);
}

@JsonSerializable()
class Chat {
  @JsonKey(name: "chat_id")
  final String chatId;

  Chat({
    required this.chatId,
  });

  Chat copyWith({
    String? chatId,
  }) =>
      Chat(
        chatId: chatId ?? this.chatId,
      );

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

@JsonSerializable()
class Email {
  @JsonKey(name: "adress")
  final String adress;
  @JsonKey(name: "confirmed")
  final bool confirmed;

  Email({
    required this.adress,
    required this.confirmed,
  });

  Email copyWith({
    String? adress,
    bool? confirmed,
  }) =>
      Email(
        adress: adress ?? this.adress,
        confirmed: confirmed ?? this.confirmed,
      );

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  Map<String, dynamic> toJson() => _$EmailToJson(this);
}

@JsonSerializable()
class Privacy {
  @JsonKey(name: "description")
  final Description description;
  @JsonKey(name: "find_me")
  final Description findMe;
  @JsonKey(name: "profile_photos")
  final Description profilePhotos;
  @JsonKey(name: "last_online")
  final Description lastOnline;

  Privacy({
    required this.description,
    required this.findMe,
    required this.profilePhotos,
    required this.lastOnline,
  });

  Privacy copyWith({
    Description? description,
    Description? findMe,
    Description? profilePhotos,
    Description? lastOnline,
  }) =>
      Privacy(
        description: description ?? this.description,
        findMe: findMe ?? this.findMe,
        profilePhotos: profilePhotos ?? this.profilePhotos,
        lastOnline: lastOnline ?? this.lastOnline,
      );

  factory Privacy.fromJson(Map<String, dynamic> json) => _$PrivacyFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyToJson(this);
}

@JsonSerializable()
class Description {
  @JsonKey(name: "type_")
  final String type;
  @JsonKey(name: "exceptions")
  final List<dynamic> exceptions;

  Description({
    required this.type,
    required this.exceptions,
  });

  Description copyWith({
    String? type,
    List<dynamic>? exceptions,
  }) =>
      Description(
        type: type ?? this.type,
        exceptions: exceptions ?? this.exceptions,
      );

  factory Description.fromJson(Map<String, dynamic> json) => _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
