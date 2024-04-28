import 'package:bloc_test_app/domain/models/message_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'paginated_dialog.g.dart';
@JsonSerializable()
class PaginatedDialog {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "data")
  final DialogData data;

  PaginatedDialog({
    required this.message,
    required this.data,
  });

  PaginatedDialog copyWith({
    String? message,
    DialogData? data,
  }) =>
      PaginatedDialog(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PaginatedDialog.fromJson(Map<String, dynamic> json) => _$PaginatedDialogFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedDialogToJson(this);
}

@JsonSerializable()
class DialogData {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "type_")
  final String type;
  @JsonKey(name: "participants")
  final List<String> participants;
  @JsonKey(name: "messages")
  final List<MessageDto> messages;

  DialogData({
    required this.id,
    required this.type,
    required this.participants,
    required this.messages,
  });

  DialogData copyWith({
    String? id,
    String? type,
    List<String>? participants,
    List<MessageDto>? messages,
  }) =>
      DialogData(
        id: id ?? this.id,
        type: type ?? this.type,
        participants: participants ?? this.participants,
        messages: messages ?? this.messages,
      );

  factory DialogData.fromJson(Map<String, dynamic> json) => _$DialogDataFromJson(json);

  Map<String, dynamic> toJson() => _$DialogDataToJson(this);
}

