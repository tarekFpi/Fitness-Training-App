// To parse this JSON data, do
//
//     final chatMessagesResponseModel = chatMessagesResponseModelFromJson(jsonString);

import 'dart:convert';

ChatMessagesResponseModel chatMessagesResponseModelFromJson(String str) => ChatMessagesResponseModel.fromJson(json.decode(str));

String chatMessagesResponseModelToJson(ChatMessagesResponseModel data) => json.encode(data.toJson());

class ChatMessagesResponseModel {
  String? id;
  String? senderId;
  String? receiverId;
  String? senderRole;
  String? message;
  String? messageType;
  String? roomId;
  dynamic replyTo;
  bool? isRead;
  String? priorityLevel;
  bool? isPinned;
  dynamic readAt;
  bool? isDeleted;
  String? createdAt;
  DateTime? updatedAt;
  String? chatMessagesResponseModelId;

  ChatMessagesResponseModel({
    this.id,
    this.senderId,
    this.receiverId,
    this.senderRole,
    this.message,
    this.messageType,
    this.roomId,
    this.replyTo,
    this.isRead,
    this.priorityLevel,
    this.isPinned,
    this.readAt,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.chatMessagesResponseModelId,
  });

  factory ChatMessagesResponseModel.fromJson(Map<String, dynamic> json) => ChatMessagesResponseModel(
    id: json["_id"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"],
    senderRole: json["sender_role"],
    message: json["message"],
    messageType: json["message_type"],
    roomId: json["room_id"],
    replyTo: json["reply_to"],
    isRead: json["is_read"],
    priorityLevel: json["priority_level"],
    isPinned: json["is_pinned"],
    readAt: json["read_at"],
    isDeleted: json["is_deleted"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    chatMessagesResponseModelId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "sender_role": senderRole,
    "message": message,
    "message_type": messageType,
    "room_id": roomId,
    "reply_to": replyTo,
    "is_read": isRead,
    "priority_level": priorityLevel,
    "is_pinned": isPinned,
    "read_at": readAt,
    "is_deleted": isDeleted,
    "createdAt": createdAt,
    "updatedAt": updatedAt?.toIso8601String(),
    "id": chatMessagesResponseModelId,
  };
}
