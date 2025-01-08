// To parse this JSON data, do
//
//     final systemResponseModel = systemResponseModelFromJson(jsonString);

import 'dart:convert';

SystemResponseModel systemResponseModelFromJson(String str) => SystemResponseModel.fromJson(json.decode(str));

String systemResponseModelToJson(SystemResponseModel data) => json.encode(data.toJson());

class SystemResponseModel {
  String? id;
  String? title;
  String? description;
  String? type;
  DateTime? expireTime;
  String? resourceName;
  dynamic resourceId;
  String? receivers;
  bool? isLockScreen;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  SystemResponseModel({
    this.id,
    this.title,
    this.description,
    this.type,
    this.expireTime,
    this.resourceName,
    this.resourceId,
    this.receivers,
    this.isLockScreen,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SystemResponseModel.fromJson(Map<String, dynamic> json) => SystemResponseModel(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    type: json["type"],
    expireTime: json["expire_time"] == null ? null : DateTime.parse(json["expire_time"]),
    resourceName: json["resource_name"],
    resourceId: json["resource_id"],
    receivers: json["receivers"],
    isLockScreen: json["is_lock_screen"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "type": type,
    "expire_time": expireTime?.toIso8601String(),
    "resource_name": resourceName,
    "resource_id": resourceId,
    "receivers": receivers,
    "is_lock_screen": isLockScreen,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
