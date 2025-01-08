// To parse this JSON data, do
//
//     final acceptExistResponseModel = acceptExistResponseModelFromJson(jsonString);

import 'dart:convert';

AcceptExistResponseModel acceptExistResponseModelFromJson(String str) => AcceptExistResponseModel.fromJson(json.decode(str));

String acceptExistResponseModelToJson(AcceptExistResponseModel data) => json.encode(data.toJson());

class AcceptExistResponseModel {
  String? id;
  String? userId;
  AcceptExistResponseModel? privacyPolicyId;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? acceptExistResponseModelId;
  String? text;

  AcceptExistResponseModel({
    this.id,
    this.userId,
    this.privacyPolicyId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.acceptExistResponseModelId,
    this.text,
  });

  factory AcceptExistResponseModel.fromJson(Map<String, dynamic> json) => AcceptExistResponseModel(
    id: json["_id"],
    userId: json["user_id"],
    privacyPolicyId: json["privacy_policy_id"] == null ? null : AcceptExistResponseModel.fromJson(json["privacy_policy_id"]),
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    acceptExistResponseModelId: json["id"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_id": userId,
    "privacy_policy_id": privacyPolicyId?.toJson(),
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": acceptExistResponseModelId,
    "text": text,
  };
}
